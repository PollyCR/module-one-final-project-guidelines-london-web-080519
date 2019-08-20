class CreateUser < ActiveRecord::Migration[4.2]
    def change
      create_table :users do |table|
        table.string :name
      end
    end
  end

