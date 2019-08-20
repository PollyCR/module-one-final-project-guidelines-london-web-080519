class CreateArticle < ActiveRecord::Migration[5.2]
    def change
      create_table :articles do |table|
        table.string :author
        table.string :title
        table.string :description
        table.text :url
        table.text :urlToImage 
        table.datetime :publishedAt 
        table.text :content
        table.integer :source_id
      end
    end
  end

