class Territory < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :name, presence: true

  def order_target
    self.users.sum(:order_target)
  end

  def orders_booked
    self.contacts.sum(:order_booked)
  end

  def self.total_order_target
    Territory.all.inject(0){ |sum, t| sum + t.order_target}
  end

  def self.total_order_booked
    Territory.all.inject(0){ |sum, t| sum + t.orders_booked}
  end
end
