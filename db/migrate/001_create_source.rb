class CreateSource < ActiveRecord::Migration[4.2]
    def change
        create_table :sources do |table|
            table.string :name
            table.string :url
            table.string :category
        end
    end
    end

