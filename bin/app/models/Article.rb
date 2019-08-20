class Article < ActiveRecord::Base
    belongs_to :source
    has_many :users, through: :favorite_articles
end
