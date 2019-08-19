require_relative '../config/environment'

cli = CLI.new
cli.get_name 

name = gets.chomp 
cli.welcome(name)

cli.welcome_options

input = gets.chomp 
cli.get_input(input)
