class Wager < ApplicationRecord
  has_many :challenges
  has_many :users, through: :challenges
  has_many :payments, through: :challenges

  validates :name, presence: true
  
  scope :order_by_name, -> {order(name: :asc)}
end
