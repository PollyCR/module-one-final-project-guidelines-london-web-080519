class FavoriteArticle < ActiveRecord::Base
    belongs_to :users
    belongs_to :article
  
    
    end#class end