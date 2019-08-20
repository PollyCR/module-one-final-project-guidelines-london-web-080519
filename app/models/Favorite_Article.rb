class FavoriteArticle < ActiveRecord::Base
    belongs_to :users
    has_many :articles
    has_many :sources, through: :articles
  
    
    end#class end