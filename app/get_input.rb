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
        selection = prompt.select("Please select from the following options:".colorize(:green), ["Headlines","Find article","Find source","My favorite articles","My favorite sources", "Exit"])
    if selection == "Headlines"
        # binding.pry
  headlines
  welcome_options
        elsif selection == "Find article"
            search_articles
            welcome_options
        elsif selection == "Find source"
            search_sources
            welcome_options
        elsif selection == "My favorite articles" 
           display_favorite_articles
           welcome_options
        elsif selection == "My favorite sources"
            display_favorite_sources
            welcome_options
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

 def display_favorite_articles
    get_favorite_articles = $current_user.get_favorite_articles
    prompt = TTY::Prompt.new
    #binding.pry
    articles = $current_user.articles.map{|article| article.title}
    article_selection = prompt.select("Please select from the below", articles)
    #puts article_selection
    article_content = Article.find{|article|article.title == article_selection}.content
    #article_id = Article.find{|article|article.title == article_selection}.id
    print article_content
end

def display_favorite_sources
    favorite_source_names = $current_user.get_favorite_sources
    prompt = TTY::Prompt.new 
    source_name = prompt.select("Favorite sources:",favorite_source_names)
    current_source = Source.find_by(name: source_name)
    current_articles = Article.where(source_code_string: current_source.source_code)
    binding.pry
    # source_headlines = get_headlines(source_name)["articles"]
    # if source_headlines == []
    #     puts "No articles found!"
    #     welcome_options
    # else
    # article_list = create_articles(source_headlines)
    # get_titles = source_headlines.map{|article|article['title']}
    # # get_content = source_headlines.map{|article|article["content"]}q
    # get_content = Article.select{|article|article.content == source_headlines.content}
    # articles = prompt.select("Articles matching your search:",get_titles)
    # article_to_save = Article.find{|article|article.title == articles}.id
    puts get_content
        save_article(article_to_save, $current_user)
        welcome_options
    # end
end




end