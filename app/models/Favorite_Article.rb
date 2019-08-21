class FavoriteArticle < ActiveRecord::Base
    belongs_to :users
    belongs_to :article
  
    def self.simple_return_favorites(user)
        self.all.where(user_id: user.id)
    end
    end#class end