class CLI

    def welcome(name)
        puts "Welcome to NewsCruncher, #{name}!".colorize(:light_blue)
      end


    def get_name
        prompt = TTY::Prompt.new 
       $name = prompt.ask('What is your name?', default: ENV['USER'])
       welcome($name)
      end 
    
    def welcome_options 
        prompt = TTY::Prompt.new
        selection = prompt.select("Please select from the following options:".colorize(:green), ["Latest from favourite sources","Find article","Find source","My reading list","My favourite sources"])
        if selection == "Latest from favourite sources"
            self.get_favorites
        elsif selection == "Find article"
            search_articles
        elsif selection == "Find source"
            search_sources
        elsif selection == "My reading list" 
        end            
            # binding.pry 
     end

def search_articles 
    prompt = TTY::Prompt.new
    $keyword_search = prompt.ask("Please enter the article keyword:")
end


def search_sources_by_category 
    prompt = TTY::Prompt.new
    selection = prompt.select("Please choose from the following categories:",%w(General Technology Business Sports Entertainment Health Science))
    if selection == "General"
        search_general
    elsif selection == "Technology"
        search_technology
    elsif selection == "Business"
        search_business
    elsif selection == "Sports"
        search_sports
    elsif selection == "Entertainment"
        search_entertainment
    elsif selection == "Health"
        search_health
    elsif selection == "Science"
        search_science
    end

end

def search_sources_by_name 
    prompt = TTY::Prompt.new 
    $source_name_search = prompt.ask("Please enter the name of the source you wish to find:")
end 

def search_sources
    prompt = TTY::Prompt.new 
    selection = prompt.select("Would you like to search by name, or by category?",["Search by name","Search by category"])
if selection.include?("name")
    search_sources_by_name
elsif selection.include?("category")
        search_sources_by_category
    end
end 


end