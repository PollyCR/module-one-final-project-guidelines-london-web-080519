class CreateArticle < ActiveRecord::Migration[5.2]
    def change
      create_table :articles do |table|
        table.string :author
        table.string :title
        table.string :description
        table.text :url
        table.text :url_to_image 
        table.datetime :published_at 
        table.text :content
        table.integer :source_id
      end
    end
  end

