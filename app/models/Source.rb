require_relative '../../config/environment.rb'


class Source < ActiveRecord::Base
    has_many :favorite_sources  
    has_many :users, through: :favorite_sources

    #find sources by category
    def self.source_search_by_category(category_search)
      category_output = self.all.select {|source|source.category == category_search}
    source_names_by_cat = category_output.map{|source|source.name}
      source_names_by_cat
    end

    #find sources by name
    def self.source_search_by_name(name_search)
    self.all.find_by(name: name_search)
    end

    # def get_source_code
    #   Source.find{|source|source.source_code}
    # end 

    def self.source_search_code(name_search)
      source = self.all.find do |source|
        # binding.pry
        source.source_code == name_search
      end
      # binding.pry
    end 

    #get all source categories
    def self.get_categories
    self.all.map{|source| source.category}.uniq
    end

    #returns source details with text, currently called from User class
    def self.return_text(id)
      sources = self.all.find{|source| source.id == id}
      print "#{sources.name} Category: #{sources.category} Description: #{sources.description}\n\n"   
    end

    def domain
      Source.find{|source|source == self.name}.domain
    end

    #def self.return_names
    #  return_text.map{|source| source.name}
    #end

end #class end