require_relative '../../config/environment.rb'

class Article < ActiveRecord::Base
    belongs_to :source
    has_many :users, through: :favorite_articles
    has_many :articles

    
    
    def self.article_search_by_keyword(keyword)
       articles_with_keyword = Article.where("content LIKE ?"|| "title LIKE?", "%#{keyword}%")
       articles_by_title = articles_with_keyword.map{|article|article.title}
       articles_by_title
    end
    
end 