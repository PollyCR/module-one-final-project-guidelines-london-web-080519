class FavoriteArticle < ActiveRecord::Base
    belongs_to :users
    belongs_to :article
  
    def self.get_favorite_articles(user)
        favorites = self.all.select{|favorite| favorite.user_id == user.id}
        favorites.each do  |favorite|
        Article.return_text(favorite.id)
        end
    end
    
    end#class end