class ChangeFavoriteSourceDataTypes < ActiveRecord::Migration[4.2]
def change
    change_column :favorite_sources, :source_id, :integer
    change_column :favorite_sources, :user_id, :integer
  end

end