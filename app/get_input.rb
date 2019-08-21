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
        selection = prompt.select("Please select from the following options:".colorize(:green), ["Headlines","Latest from favourite sources","Find article","Find source","My reading list","My favourite sources"])
    if selection == "Headlines"
        puts headlines
        # binding.pry
    elsif selection == "Latest from favourite sources"
            self.get_favorites
        elsif selection == "Find article"
            search_articles
        elsif selection == "Find source"
            search_sources
        elsif selection == "My reading list" 
<<<<<<< HEAD
            self.get_favorites_readable
        end            
=======
            display_favorite_articles           
        elsif selection == "My favourite sources"
            display_favorite_sources
        end
>>>>>>> ce9b3f91c8693beb96f871054f8f628b2b4a03d9
            # binding.pry 
     end

def search_articles 
    prompt = TTY::Prompt.new
    keyword_search = prompt.ask("Please enter the article keyword:")
    articles_with_keyword = Article.article_search_by_keyword(keyword_search)
    article_selection = prompt.select("Articles found:", articles_with_keyword.title)
    article_content = Article.find{|article|article.title == article_selection}.content
    puts article_content
    save_article(article_selection, $current_user)
end

def save_article(article,user)
    prompt = TTY::Prompt.new 
    save_article = prompt.yes?("Would you like to save this article?")
    if true 
        User.save_favorite_article_by_id(save_article.id,user)
    else welcome_options
    end
end

def headlines
    prompt = TTY::Prompt.new
    headlines = Article.all.map{|article|article.title}
    todays_headlines = prompt.select("Today's headlines",headlines)
    article_content = Article.find{|article|article.title == todays_headlines}.content
    puts article_content
    save_article(todays_headlines, $current_user)
    
end

def save_prompt(source_name, user)
    prompt = TTY::Prompt.new 
    save_source = prompt.yes?("Would you like to save this source?")
    if true 
        User.save_favorite_by_name(source_name, user)
    end
    go_back?
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
        go_back?
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
    go_back?
end 

def display_favorite_sources
    FavoriteSource.get_favoirte_sources_by_name($current_user)
end


end