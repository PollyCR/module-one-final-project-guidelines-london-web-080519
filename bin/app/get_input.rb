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
            puts "Please enter your search term"
        elsif selection == "Find source"
            search_sources
        elsif selection == "My reading list" 
        end            
            # binding.pry 
     end

def invalid_command 
    puts "Invalid command"
end

def search_sources
    prompt = TTY::Prompt.new 
    selection = prompt.select("Would you like to search by name, or by category?",["Search by name","Search by category"])
end

def source_search_select(input)
    input = input.to_i
    if input == 1
        puts "Please enter the source name"
        # input = gets.chomp
        # search_source_by_name(input)
     elsif input == 2 
        puts "Choose from the following source categories: 
        1.  General
        2.  Technology
        3.  Business
        4.  Sports
        5.  Health
        6.  Science
        7.  Entertainment"
        # input = gets.chomp.to_i
        # search_source_by_category(input)
        else invalid_command 
        go_back 
    end
end

end