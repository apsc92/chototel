class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :display_name
      t.string :role
      t.references :territory
      t.integer :meeting_target, default: 0
      t.integer :order_target, default: 0       
      t.timestamps
    end
  end
end
