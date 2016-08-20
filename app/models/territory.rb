class Territory < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :name, presence: true

  def self.aggregated_order_targets
    territory_ids = Territory.ids
    order_targets = User.where(territory_id: territory_ids).group('users.territory_id').sum(:order_target) 
  end

  def self.aggregated_orders_booked
    territory_ids = Territory.ids
    orders_booked = Contact.where(territory_id: territory_ids).group('contacts.territory_id').sum(:order_booked)  
  end
end
