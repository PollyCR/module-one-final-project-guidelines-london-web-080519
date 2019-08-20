 require_relative '../config/environment.rb'

 cli = CLI.new
 prompt = TTY::Prompt.new 
 cli.get_name 
 cli.welcome_options
 input = gets.chomp 