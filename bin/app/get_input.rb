class CLI
  
    def get_name
        puts "Welcome to NewsCruncher! Please enter your name:"
      end 
      
      def find_or_create_by_name(name)
        User.find_or_create_by(name: name)
      end 
    
      def welcome(name)
        puts "Welcome, #{name}!"
      end 
    
    def welcome_options 
    puts "Please select from the following options: 
    
    1. Latest from favourite sources
    2. Find article
    3. Find source
    4. My reading list
    5. My favourite sources"

    get_input(input = gets.chomp)

end

def go_back
    puts "Type 'back' to go back." 
    input = gets.chomp
    if input == "back"
        welcome_options 
    else invalid_command
    end
end

def invalid_command 
    puts "Invalid command"
end


def get_input(input)
    # binding.pry
    input = input.to_i
    if input==1 
        puts "Here are the headlines from your favourite sources."

    elsif input == 2
        puts "Please enter a search term:"
        
    elsif input == 3
        puts "1.    Search by name
        2.  Search by category"

    elsif input == 4 
        puts "Here is your reading list:"

    elsif input == 5
        puts "Here are your favourite sources:"

    else invalid_command
    end
    go_back

end
end 

