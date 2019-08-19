class Source < ActiveRecord::Base
    has_many :users, through: :favorite_sources

    #def self.all_books_with_less_than_99_pages(category)
    #    Book.all.where("page_count < 100")
    #end
    
    def self.source_search_by_category(category_input)
    self.find_by(category: category_input)
    end

    def self.source_search_by_name(name_input)
    self.find_by(category: name_input)
    end


end #class end