class AddCommentAndDateToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :comments, :text
    add_column :contacts, :meeting_date, :date 
  end
end
