class User < ApplicationRecord
  devise :database_authenticatable
  has_many :contacts, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :password, on: :create
  validates :email, :format => Devise.email_regexp, uniqueness: true, presence: true
  validates :role, inclusion: { in: %w(admin staff), message: "%{value} is not a valid role"}

  def is_admin?
    self.role == 'admin'
  end

  def name_displayed
    self.display_name.present? ? self.display_name : self.name
  end

  def meeting_done(status)
    self.contacts.where(meeting_done: true, status: status).count
  end

  def orders_confirmed
    self.contacts.sum(:order_confirmed)
  end

  def potential_order
    self.contacts.sum(:potential_order_book)
  end
end
