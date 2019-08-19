require_relative 'models/User.rb'
def new_user
    user = User.new
    user.name = gets.chomp
    user.save 
    return user
  end

  def get_name
    puts "Welcome to NewsCruncher! Please enter your name:"
  end 
  
  def find_or_create_by_name(name)
    User.find_or_create_by(name: name)
  end 

  def welcome(name)
    puts "Welcome, #{name}!"
  end 
