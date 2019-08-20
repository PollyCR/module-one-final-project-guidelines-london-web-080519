require "bundler/setup"
Bundler.require

require_all 'app'

connection_details = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/newscruncher.db')
ActiveRecord::Base.logger = nil