class FavoriteSource < ActiveRecord::Base
belongs_to :sources
belongs_to :users
has_many :articles


end#class end