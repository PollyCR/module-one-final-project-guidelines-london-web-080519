class CreateFavoriteSource < ActiveRecord::Migration[4.2]
    def change
        create_table :favortie_sources do |table|
            table.string :user_id
            table.string :source_id
            table.string :datetime
        end
    end
    end

    