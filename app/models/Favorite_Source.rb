class FavoriteSource < ActiveRecord::Base
belongs_to :source
belongs_to :user
# has_many :articles


def self.get_favorite_sources_by_name(user)
    favorites = self.all.select{|favorite| favorite.user_id == user.id}
    favorites.each {|favorite|Source.return_text(favorite.id)}
end

def self.headlines_from_favorite_sources(user)
    prompt = TTY::Prompt.new
    fav_source = FavoriteSource.all.select {|source| source.user_id == user.id}
    fav_source_id = fav_source.map {|source| source.source_id}
    fav_source_article = Article.all.where(source_id: fav_source_id)
    headline_selection = fav_source_article.map {|article| article.title}
    prompt.select("Please select the headline to read the article:", headline_selection)
   end

end#class end