class User < ActiveRecord::Base
has_many :favorite_sources 
has_many :favorite_articles
end
