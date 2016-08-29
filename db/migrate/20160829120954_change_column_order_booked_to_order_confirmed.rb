class ChangeColumnOrderBookedToOrderConfirmed < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :order_booked, :order_confirmed
  end
end
