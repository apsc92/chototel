class User < ApplicationRecord
  devise :database_authenticatable
  belongs_to :territory
  has_many :contacts, dependent: :destroy

  validates_presence_of :email, :name
  validates_presence_of :password, on: :create
  validates :email, :format => Devise.email_regexp
  validates :role, inclusion: { in: %w(admin staff), message: "%{value} is not a valid role"}


  def is_admin?
    self.role == 'admin'
  end

  def name_displayed
    self.display_name || self.name
  end

  def meeting_done
    self.contacts.where(meeting_done: true).count
  end

  def orders_booked
    self.contacts.sum(:order_booked)
  end
end
