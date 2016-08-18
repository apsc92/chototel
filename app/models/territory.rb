class Territory < ApplicationRecord
  has_many :users
  has_many :contacts

  validates :name, presence: true
end
