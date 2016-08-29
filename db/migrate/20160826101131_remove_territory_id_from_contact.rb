class RemoveTerritoryIdFromContact < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :territory_id, :integer
  end
end
