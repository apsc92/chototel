class AddTerritoryRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :territory, foreign_key: true
  end
end
