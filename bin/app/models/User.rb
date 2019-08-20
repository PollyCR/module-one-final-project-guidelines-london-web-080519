
class User < ActiveRecord::Base
    has_many :favourite_sources  
    has_many :sources, through: :favourite_sources
    has_many :articles, through: :favorite_articles

#saves a favorite given a source_id as "source" argument
def save_favorite(source)
    FavoriteSource.create(user_id: self.id, source_id: source)
end

#private method to get all favorites by user instance
def get_favorites
    favorite_list = FavoriteSource.all.where("user_id = #{self.id}")
end

#returns user's favorite source list
def get_favorites_readable
    get_favorites.map {|favorite| Source.return_text(favorite.source_id)}
end



end