class FavoriteSource < ActiveRecord::Base
belongs_to :source
belongs_to :user
has_many :articles


def self.get_favoirte_sources_by_name(user)
    favorites = self.all.select{|favorite| favorite.user_id == user.id}
    favorites.each do  |favorite|
    Source.return_text(favorite.id)
    end
end


end#class end