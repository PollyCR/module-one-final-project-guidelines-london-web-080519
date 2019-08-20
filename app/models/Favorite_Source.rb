class FavoriteSource < ActiveRecord::Base
belongs_to :source
belongs_to :user
has_many :articles


end#class end