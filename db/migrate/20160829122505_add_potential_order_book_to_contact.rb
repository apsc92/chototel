class AddPotentialOrderBookToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :potential_order_book, :integer, default: 0
  end
end
