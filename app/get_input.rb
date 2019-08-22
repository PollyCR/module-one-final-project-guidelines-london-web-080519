require_relative '../config/environment.rb'

class CLI

    def welcome(name)
        puts "Welcome to NewsCruncher, #{name}!".colorize(:light_blue)
    end

    def get_name
        prompt = TTY::Prompt.new 
        $name = prompt.ask('What is your name?', default: ENV['USER'])
        welcome($name)
        $current_user = User.find_or_create_by(name: $name)

    end 
    
    def welcome_options 
        prompt = TTY::Prompt.new
        selection = prompt.select("Please select from the following options:".colorize(:green), ["Headlines","Latest from favourite sources","Find article","Find source","My favorite articles","My favorite sources", "Exit"])
    if selection == "Headlines"
        # binding.pry
  headlines
    elsif selection == "Latest from favourite sources"
        latest_from_favorite_sources
        elsif selection == "Find article"
            search_articles
        elsif selection == "Find source"
            search_sources
        elsif selection == "My favorite articles" 
           display_favorite_articles
        elsif selection == "My favorite sources"
            display_favorite_sources
        else selection == "Exit"
            exit
        end
            # binding.pry 
     end

def headlines
    prompt = TTY::Prompt.new
    headlines = Article.all.map{|article|article.title}
    todays_headlines = prompt.select("Today's headlines",headlines)
    article_content = Article.find{|article|article.title == todays_headlines}.content
    article_id = Article.find{|article|article.title == todays_headlines}.id
    puts article_content
    save_article(article_id, $current_user)
end

def create_sources(sources)
    sources.each {|source| Source.create(source_code: source['id'],name:source['name'], description: source['description'],url: source['url'], category: source['category'], language: source['language'], country: source['country'])}
   end
def create_articles(articles)
    new_articles = articles.each{|article|Article.create(source_id: Source.source_search_code(article['source']['id']),author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}
 end 

def latest_from_favorite_sources
    puts  FavoriteSource.headlines_from_favorite_sources($current_user)
    end

def display_favorite_articles
    favorite_articles = $current_user.get_favorite_articles
    prompt = TTY::Prompt.new
    article_selection = prompt.select("Please select from the below", favorite_articles)
    article_content = Article.find{|article|article.title == article_selection}.content
    article_id = Article.find{|article|article.title == article_selection}.id
    print article_content
end

def display_favorite_sources
    favorite_source_names = $current_user.get_favorite_sources
    prompt = TTY::Prompt.new 
    choose_source = prompt.select("Favorite sources:",favorite_source_names)
    prompt = TTY::Prompt.new 
    # source_headlines = get_headlines(choose_source).select{|array|array['articles']}.values[0].each {|article| Article.create(source_id: Source.source_search_name(article['source']['id']).id, author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}[0]
    article_titles = 
    binding.pry
    source_news = prompt.select("Latest news from #{choose_source}",article_titles)
    article_content = Article.find{|article|article.title == source_news}.content
    puts article_content
        save_article(source_news, $current_user)
    # binding.pry
    
end




end