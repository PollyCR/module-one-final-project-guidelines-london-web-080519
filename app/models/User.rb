
class User < ActiveRecord::Base
    has_many :favorite_sources
    has_many :favorite_articles 
    has_many :sources, through: :favorite_sources
    has_many :articles, through: :favorite_articles

#saves a favorite given a source_id as "source" argument
def self.save_favorite_by_name(name_search, user)
   source = Source.source_search_by_name(name_search)
   save_favorite(source.id, user)
end

#saves a favorite given the source id
def self.save_favorite(source, user)
    FavoriteSource.create(user_id: user.id, source_id: source)
end

def get_user_id 
    user_id = User.all.map{|user|user.id}
end

#private method to get all favorites by user instance
def get_favorite_sources
    self.sources.map{|source| source.name}
# user_id = User.all.map{|user|user.id}[0]
# my_favorite_sources = favorite_sources.where("user_id =#{user_id}")
end


def get_favorite_articles 
    self.articles.map{|article|article.title}
end 

# def self.favorite_articles
#     user_id = User.all.map{|user|user.id}[0]
#     # binding.pry
#     favorite_articles = FavoriteArticle.all.where("user_id = #{user_id}")
#     binding.pry
# end

#returns user's favorite source list, formatted
def get_favorites_readable
    get_favorites.map {|favorite| Source.return_text(favorite.source_id)}
end

#saves a favorite article
def self.save_favorite_article(article, user)
    FavoriteArticle.create(user_id: user, article_id: article)
end
#     article = Source.source_search_by_name(name_search)
#     if source == nil
#      print "The source name entered is incorrect"
#     else
#     save_favorite(source.id, user)
#     puts "Success! The source is now available in your Favorite Sources."
#     end
#  end


end