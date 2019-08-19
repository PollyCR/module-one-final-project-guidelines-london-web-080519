class CreateFavoriteSource < ActiveRecord::Migration[5.2]
    def change
        create_table :favorite_sources do |table|
            table.string :user_id
            table.string :source_id
        end
    end
    end

    