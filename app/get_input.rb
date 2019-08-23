require_relative '../config/environment.rb'

class CLI

    def welcome(name)
        puts "Welcome to NewsCruncher, #{name}!".colorize(:light_blue)
    end

    def new_user
        user = User.new
        user.name = gets.chomp
        user.save 
        return user
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

     end
     def search_sources_by_category 
        prompt = TTY::Prompt.new
            category_search = prompt.select("Please choose from the following categories:",%w(General Technology Business Sports Entertainment Health Science))	  
           Source.source_search_by_category(category_search.downcase)
            prompt = TTY::Prompt.new 
            search_results = Source.source_search_by_category(category_search.downcase)
            to_save = prompt.select("Please choose from the following sources:",search_results)
            save_source?(to_save, $current_user)
            welcome_options
    end
    
    def search_articles 
        prompt = TTY::Prompt.new 
        keyword_search = prompt.ask("Please enter the article keyword", required: true)
        prompt = TTY::Prompt.new 
        articles_with_keyword = Article.where('content LIKE ?',"%#{keyword_search}%").all
        if articles_with_keyword.empty?
            puts "No articles found!"
        else
        article_titles = articles_with_keyword.map{|article|article.title}
        article_selection = prompt.select("The following articles were found:", articles_with_keyword.title)
             article_to_save = Article.find_by(title: article_selection).id
             save_article?(article_to_save, $current_user)
             welcome_options
        end 
    end

     def save_article?(article,user)
        prompt = TTY::Prompt.new 
        save_article = prompt.yes?("Would you like to save this article?")
        if save_article
            FavoriteArticle.create(user_id: user.id,article_id: article)
            puts "Success! The article is now available in your Favorite Articles."
        else
       welcome_options
        end
    end

    def get_source_id(source)
        id = Source.where(name: source).ids
    end 


    def save_source?(source,user)
        prompt = TTY::Prompt.new 
        save_source= prompt.yes?("Would you like to save this source?")
        if false
            welcome_options
        elsif save_source
            source_id = get_source_id(source)[0]
            new_favorite = FavoriteSource.create(user_id: user.id,source_id: source_id)
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
   if favorite_articles.empty?
   puts "No favorite articles yet!"
else
   articles = $current_user.articles.map{|article|article.title}
   select_article = prompt.select("Select from the following articles:", articles.uniq)
   article_content = Article.find{|article|article.title == select_article}.content
   puts article_content
end
end

def display_favorite_sources
    favorite_source_names = $current_user.get_favorite_sources
    if favorite_source_names.empty?
        puts "No favorite sources yet!"
    else
    prompt = TTY::Prompt.new 
    source_name = prompt.select("Favorite sources:",favorite_source_names.uniq)
    
    current_source = Source.find_by(name: source_name)
  

    current_articles = Article.where(source_id: current_source.id)
   
    current_article_title=prompt.select("Latest headlines from:",current_articles.title)
    selected_article = Article.where(title: current_article_title).find{|article|article}.content
    article_id_to_save = Article.where(title:current_article_title).find{|article|article}.id
    puts selected_article
    save_article?(article_id_to_save,$current_user)
    end
end




end