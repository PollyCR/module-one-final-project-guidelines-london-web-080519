class CreateUser < ActiveRecord::Migration[5.2]
    def change
      create_table :users do |table|
        table.string :name
        table.timestamps null: false
      end
    end
  end

