class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :institute
      t.string :category
      t.references :user
      t.references :territory
      t.boolean :meeting_done, default: false
      t.integer :order_booked, default: 0
      t.timestamps
    end
  end
end
