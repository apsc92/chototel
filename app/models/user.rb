class User < ApplicationRecord
  devise :database_authenticatable, :rememberable
  belongs_to :territory
  has_many :contacts

  validates_presence_of :email, :name, :password
  validates :email, :format => Devise.email_regexp
  validates :role, inclusion: { in: %w(admin, staff), message: "%{value} is not a valid role"}


  def is_admin?
    self.role == 'admin'
  end
end
