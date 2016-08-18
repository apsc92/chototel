class AddTerritoryRefToContacts < ActiveRecord::Migration[5.0]
  def change
    add_reference :contacts, :territory, foreign_key: true
  end
end
