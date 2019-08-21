require_relative '../../config/environment.rb'

class Article < ActiveRecord::Base
    belongs_to :source
    has_many :users, through: :favorite_articles
    has_many :articles

    
    
    def self.article_search_by_keyword(keyword)
       articles_with_keyword = Article.where("content LIKE ?"|| "title LIKE?", "%#{keyword}%")
       
       return articles_with_keyword
    end

    # def self.article_find_by_id(id)
    #     article.find(id)
    # end 
end 