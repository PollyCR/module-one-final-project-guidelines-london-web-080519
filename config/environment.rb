
require "bundler/setup"

require "sinatra/activerecord"
require 'rest-client'
require 'ostruct'
require 'date'
require 'pry'
require_relative '../app/models/User.rb'
require_relative '../app/models/Favorite_Source.rb'
require_relative '../db/seeds.rb'
require_relative '../app/get_input.rb'


Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/newscruncher.db')
require_all 'lib'
require_all 'bin'
require_all 'db'
require_all 'app'
