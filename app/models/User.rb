
class User < ActiveRecord::Base
    has_many :favourite_sources  
    has_many :sources, through: :favourite_sources
    has_many :articles, through: :favorite_articles

#saves a favorite given a source_id as "source" argument
def self.save_favorite_by_name(name_search, user)
  
   source = Source.source_search_by_name(name_search)
   if source == nil
    print "The source name entered is incorrect"
   else
   save_favorite(source.id, user)
   end
end

# def self.find_or_create_by_name 
#     find_or_create_by(name: name)
#     name = gets.chomp 
#   end 

#saves a favorite given the source id
def self.save_favorite(source, user)
    FavoriteSource.create(user_id: user.id, source_id: source)
end

#private method to get all favorites by user instance
def get_favorites
    favorite_list = FavoriteSource.all.where("user_id = #{self.id}")
end

#returns user's favorite source list, formatted
def get_favorites_readable
    get_favorites.map {|favorite| Source.return_text(favorite.source_id)}
end


end