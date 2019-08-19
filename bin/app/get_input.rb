class CLI

    def welcome(name)
        puts "Welcome, #{name}!"
      end


    def get_name
        prompt = TTY::Prompt.new 
       $name = prompt.ask('What is your name?', default: ENV['USER'])
       welcome($name)
      end 


    
    def welcome_options 
        prompt = TTY::Prompt.new 
        selection = prompt.select("Please select from the following options:", ["Latest from favourite sources","Find article","Find source","My reading list","My favourite sources"])
        if selection == "Latest from favourite sources"
            puts "Here are your favourite sources"
        elsif selection == "Find article"
            search_articles
        elsif selection == "Find source"
            search_sources
        elsif selection == "My reading list" 
        end            
            # binding.pry 
     end

def invalid_command 
    puts "Invalid command"
end

def search_sources_by_category 
    prompt = TTY::Prompt.new
    selection = prompt.select("Please choose from the following categories:",%w(General Technology Business Sports Entertainment Health Science))
end

def search_sources
    prompt = TTY::Prompt.new 
    selection = prompt.select("Would you like to search by name, or by category?",["Search by name","Search by category"])
    if selection.include?("category")
        search_sources_by_category
    end
end 


end