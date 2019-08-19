class CreateFavoriteArticle < ActiveRecord::Migration[5.2]
    def change
      create_table :favorite_articles do |table|
        table.string :author
        table.string :title
        table.string :description
        table.text :url
        table.text :url_to_image 
        table.datetime :published_at 
        table.text :content
      end
    end
  end

