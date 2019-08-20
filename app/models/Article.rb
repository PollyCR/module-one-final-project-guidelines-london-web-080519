class Article < ActiveRecord::Base
    belongs_to :source
    has_many :users, through: :favorite_articles

    def article_search_by_keyword(keyword = gets.chomp)
        article_hash.map{|article|article.include?(keyword)}
    end
end 