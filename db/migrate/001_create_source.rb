class CreateSource < ActiveRecord::Migration[5.2]
    def change
        create_table :sources do |table|
            table.string :name
            table.string :description
            table.string :url
            table.string :category
            table.string :language 
            table.string :country 
        end
    end
    end

