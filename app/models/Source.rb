require_relative '../../config/environment.rb'

class Source < ActiveRecord::Base
    has_many :favourite_sources  
    has_many :users, through: :favourite_sources

    #def self.all_books_with_less_than_99_pages(category)
    #    Book.all.where("page_count < 100")
    #end



    #find sources by category
    def self.source_search_by_category(category_search)
    category_output = self.all.select {|source|source.category == category_search}
    source_names_by_cat = category_output.map{|source|source.name}
    source_names_by_cat
    # binding.pry
    # if category_output == nil
    #   puts "No sources found for that category"
    # else
    # category_output.each do |source|
    #   puts "#{source.id} - #{source.name}"
    # end
    # end
    end

    self.source_search_by_category("general")

    #find sources by name
    def self.source_search_by_name(name_search)
    self.all.find_by(name: name_search)
    end

    def self.source_search_name(name_search)
      self.all.find{|source|source.source_code == name_search}
    end 

    #get all source categories
    def self.get_categories
    self.all.map{|source| source.category}.uniq
    end

    #returns source details with text, currently called from User class
    def self.return_text(id)
      self.all.find{|source| source.id == id}.map{|source|source.name}
    end

    #def self.return_names
    #  return_text.map{|source| source.name}
    #end

end #class end