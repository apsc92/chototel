class ChangeDefaultValueOfStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default :contacts, :status, 'Cold'
  end
end
