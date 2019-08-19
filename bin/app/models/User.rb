class User < ActiveRecord::Base
has_many :sources, through: :favorite_sources 
has_many :articles, through: :favorite_articles
end
