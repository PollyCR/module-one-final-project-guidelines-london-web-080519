class Article < ActiveRecord::Base
    belongs_to :source
    has_many :users, through: :favorite_articles

    def self.list_by_source(source)
        self.all.select {|article| article.source_id == source}
    end

















    end
    