<<<<<<< HEAD
require "bundler/setup"

require "sinatra/activerecord"
require 'ostruct'
require 'date'
require_relative '../bin/app/models/User.rb'
require_relative '../bin/app/new_user.rb'
require_relative '../bin/app/get_input.rb'
=======
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
>>>>>>> e22956507c29e66e1fe6fd179c68adcb226ed0f2

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
<<<<<<< HEAD
ActiveRecord::Base.establish_connection(connection_details)
  
=======
#ActiveRecord::Base.establish_connection(connection_details)establish_connection
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/schema.db')
require_all 'lib'
require_all 'bin'
>>>>>>> e22956507c29e66e1fe6fd179c68adcb226ed0f2
