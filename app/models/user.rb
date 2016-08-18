class User < ApplicationRecord
  devise :database_authenticatable, :rememberable
  belongs_to :territory
  has_many :contacts

  validates :email, presence: true
  validates :name, presence: true
end
