class FavoriteSource < ActiveRecord::Base
belongs_to :users
has_many :articles


end#class end
