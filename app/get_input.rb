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

     def get_articles(keyword_search) 
        articles = JSON.parse(RestClient.get"https://newsapi.org/v2/everything?q=#{keyword_search}&from=2019-08-20&to=2019-08-20&language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad")
     end

     def create_article(articles)
        new_articles = articles.each{|article| Article.create(source_id: Source.source_search_name(article['source']['id'])).id}
        binding.pry 
        #author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}
            
    end
def search_articles 
    prompt = TTY::Prompt.new 
    keyword_search = prompt.ask("Please enter the article keyword")
    prompt = TTY::Prompt.new 
    articles_with_keyword = get_articles(keyword_search).select{|array|array['articles']}.values[0]
    # binding.pry
    create_article(articles_with_keyword)
    matching_titles = saved_articles
    articles = prompt.select("Articles matching your search:",matching_keyword)
    article_content = Article.find{|article|article.title == articles}.content
    puts article_content
        save_article(articles, $current_user)
end

def save_article(article,user)
    prompt = TTY::Prompt.new 
    save_article = prompt.yes?("Would you like to save this article?")
    if true 
        User.save_favorite_article(article,user)
    else welcome_options
    end
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

def save_prompt(source_name, user)
    prompt = TTY::Prompt.new 
    save_source = prompt.yes?("Would you like to save this source?")
    if true 
        User.save_favorite_by_name(source_name, user)
    else welcome_options
    end
    welcome_options
end

def search_sources_by_category 
    prompt = TTY::Prompt.new
        category_search = prompt.select("Please choose from the following categories:",%w(General Technology Business Sports Entertainment Health Science))	  
       Source.source_search_by_category(category_search.downcase)
        prompt = TTY::Prompt.new 
        search_results = Source.source_search_by_category(category_search.downcase)
        # binding.pry
        to_save = prompt.select("Please choose from the following sources:",search_results)
        #binding.pry
        save_prompt(to_save, $current_user)
        welcome_options
end

def search_sources_by_name 
    prompt = TTY::Prompt.new 
    name_search = prompt.ask("Please enter the name of the source you wish to find:")
    Source.source_search_by_name(name_search)
end 

def search_sources
    prompt = TTY::Prompt.new 
    selection = prompt.select("Would you like to search by name, or by category?",["Search by name","Search by category"])
if selection.include?("name")
    search_sources_by_name
elsif selection.include?("category")
        search_sources_by_category
    end
    welcome_options
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



def get_headlines(source_name)
    source_for_headlines = Source.find{|source|source.name == source_name}
    url = source_for_headlines.url.sub(/^https?\:\/\/(www.)?/,'')
    # binding.pry
    source_headlines = JSON.parse(RestClient.get"https://newsapi.org/v2/everything?domains=#{url}&language=en&apiKey=18f1d787fdf24f74b097f41574c6dbad")
#  binding.pry
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