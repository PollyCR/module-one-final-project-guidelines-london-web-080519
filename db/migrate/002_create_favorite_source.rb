class CreateFavoriteSource < ActiveRecord::Migration[5.2]
    def change
        create_table :favorite_sources do |table|
            table.integer :user_id
            table.integer :source_id
            table.timestamp
        end
    end


    
    end

    