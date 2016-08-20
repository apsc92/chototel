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
end
