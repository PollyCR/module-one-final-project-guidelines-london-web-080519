# require 'bundler'
# Bundler.require
# require_relative '../bin/app/module/Source.rb'

# ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/schema.db')
# require_all 'lib'
# require_all 'bin'

# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

require "bundler/setup"

require "sinatra/activerecord"
require "active_record"
require 'ostruct'
require 'date'
require_relative '../bin/app/models/Source.rb'
require 'tty-prompt'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
#ActiveRecord::Base.establish_connection(connection_details)establish_connection
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/schema.db')
require_all 'lib'
require_all 'bin'
