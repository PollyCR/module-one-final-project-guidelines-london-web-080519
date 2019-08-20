class Source < ActiveRecord::Base
    has_many :users, through: :favorite_sources

    #def self.all_books_with_less_than_99_pages(category)
    #    Book.all.where("page_count < 100")
    #end


end #class end
