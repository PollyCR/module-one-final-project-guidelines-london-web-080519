require_relative '../config/environment.rb'

class Source < ActiveRecord::Base
    has_many :favourite_sources  
    has_many :users, through: :favourite_sources


    end

    #def self.all_books_with_less_than_99_pages(category)
    #    Book.all.where("page_count < 100")
    #end
    
    #find sources by category
    def self.source_search_by_category(category_search)
    self.all.find_by(category: category_search)
    end

    #find sources by name
    def self.source_search_by_name(name_search)
    self.all.find_by(category: name_search)
    end

    #get all source categories
    def self.get_categories
    self.all.map {|source| source.category}.uniq
    end

    #returns source details with text, currently called from User class
    def self.return_text(id)
      self.all.select{|source| source.id == id}.map{|source|source.name}
    end

    #def self.return_names
    #  return_text.map{|source| source.name}
    #end

end #class end