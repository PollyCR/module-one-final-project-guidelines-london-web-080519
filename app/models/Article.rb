require_relative '../../config/environment.rb'

class Article < ActiveRecord::Base
    belongs_to :source
    has_many :users, through: :favorite_articles
    has_many :articles

    
    def self.article_search_by_keyword(keyword)
       articles_with_keyword = Article.where("content LIKE ?"|| "title LIKE?", "%#{keyword}%")
       
       return articles_with_keyword
    end

    def self.article_find_by_id(id)
         Article.find(id)
    end 

    def self.return_text(id)
        article = self.all.find{|article| article.id == id}
        source = article.source_id
        print "#{article.title}, Source: #{Source.find(source).name}, Author: #{article.author} \n\n"
    end


    #   t.integer "source_id"
    #   t.string "author"
    #   t.string "title"
    #   t.string "description"
    #   t.text "url"
    #   t.text "urlToImage"
    #   t.datetime "publishedAt"
    #   t.text "content"

end 