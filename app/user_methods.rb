require_relative 'models/User.rb'
def new_user
    user = User.new
    user.name = gets.chomp
    user.save 
    return user
  end

  def get_name
    name = gets.chomp 
  end 
  

