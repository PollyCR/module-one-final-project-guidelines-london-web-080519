class FavoriteArticle < ActiveRecord::Base
    belongs_to :user
    belongs_to :article
  
    def favorite_articles
        self.all.where("user_id == user.id")
    end
    end#class end