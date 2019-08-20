
require "bundler/setup"
Bundler.require

# require "sinatra/activerecord"
# require 'rest-client'
# require 'ostruct'
# require 'date'
# require 'pry'
# require_relative '../app/models/User.rb'
# require_relative '../app/models/Source.rb'
# require_relative '../app/models/Favorite_Source.rb'
# require_relative '../db/seed.rb'
# require_relative '../app/get_input.rb'
require_all 'app'



# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/newscruncher.db')
ActiveRecord::Base.logger = nil
# require_all 'lib'
# require_all 'bin'
# require_all 'db'
