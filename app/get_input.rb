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
            search_sources_by_category
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

     def save_article?(article,user)
        prompt = TTY::Prompt.new 
        save_article = prompt.yes?("Would you like to save this article?")
        if false 
        welcome_options
        elsif
            FavoriteArticle.create(user_id: user.id,article_id: article)
            puts "Success! The article is now available in your Favorite Articles."
       welcome_options
        end
    end

    def save_source?(article,user)
        prompt = TTY::Prompt.new 
        save_source= prompt.yes?("Would you like to save this source?")
        if false
            welcome_options
        elsif true 
            FavoriteSource.create(user_id: user.id,source_id: source)
            puts "Success! The source is now available in your Favorite Sources."
        end
       welcome_options
    end

def headlines
    prompt = TTY::Prompt.new
    headlines = Article.all.map{|article|article.title}
    todays_headlines = prompt.select("Today's headlines",headlines)
    article_content = Article.find{|article|article.title == todays_headlines}.content
    article_id = Article.find{|article|article.title == todays_headlines}.id
    # binding.pry
    puts article_content
    sleep 2
    save_article?(article_id,$current_user)
end

def create_sources(sources)
    sources.each {|source| Source.create(source_code: source['id'],name:source['name'], description: source['description'],url: source['url'], category: source['category'], language: source['language'], country: source['country'])}
   end
def create_articles(articles)
    new_articles = articles.each{|article|Article.create(source_id: Source.source_search_code(article['source']['id']),author: article['author'], title: article['title'], description: article['description'], url: article['url'], urlToImage: article['urlToImage'], publishedAt: article['publishedAt'],  content: article['content'])}
 end 

 def display_favorite_articles
   prompt = TTY::Prompt.new
   favorite_articles = FavoriteArticle.where(user_id: $current_user.id)
   articles = $current_user.articles.map{|article|article.title}
#    binding.pry
#    article_titles = Article.select{|article|article.id == }
#    binding.pry
   select_article = prompt.select("Select from the following articles:", articles)
   article_content = Article.find{|article|article.title == select_article}.content
#    binding.pry
   puts article_content
#    binding.pry
end




def display_favorite_sources
    favorite_source_names = $current_user.get_favorite_sources
    prompt = TTY::Prompt.new 
    source_name = prompt.select("Favorite sources:",favorite_source_names)
    current_source = Source.find_by(name: source_name)
    current_articles = Article.where(source_id: current_source.id)
    current_article_title=prompt.select("Latest headlines from:",current_articles.title)
    selected_article = Article.where(title: current_article_title).find{|article|article}.content
    article_id_to_save = Article.where(title:current_article_title).find{|article|article}.id
    puts selected_article
    save_article?(article_id_to_save,$current_user)
end




end