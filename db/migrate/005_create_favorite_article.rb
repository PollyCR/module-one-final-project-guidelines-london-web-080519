class CreateFavoriteArticle < ActiveRecord::Migration[5.2]
    def change
      create_table :favorite_articles do |table|
        table.integer :user_id
        table.integer :article_id
        table.string :source_id
        table.timestamp :created
      end
    end
  end



