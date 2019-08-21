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

def search_articles 
    prompt = TTY::Prompt.new
    keyword_search = prompt.ask("Please enter the article keyword:".colorize(:magenta))
    articles_with_keyword = Article.article_search_by_keyword(keyword_search)
    article_selection = prompt.select("Articles found:", articles_with_keyword.title)
    article_content = Article.find{|article|article.title == article_selection}.content

    article_id = Article.find{|article|article.title == article_selection}.id

    puts article_content
    save_article(article_id, $current_user)
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
    prompt = TTY::Prompt.new
    article_selection = prompt.select("Please select from the below", Article.return_favorites($current_user))
    article_content = Article.find{|article|article.title == article_selection}.content
    article_id = Article.find{|article|article.title == article_selection}.id
    print article_content
end

def display_favorite_sources
    #prompt = TTY::Prompt.new
    #select_favourite = prompt.select("Select from the sources below:", FavoriteSource.get_favorite_sources_by_name($current_user)).name
    #  binding.pry
    favorite_source_names = $current_user.get_favorite_sources
    puts favorite_source_names
end


end