class RemoveTerritoryIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :territory_id, :integer
  end
end
