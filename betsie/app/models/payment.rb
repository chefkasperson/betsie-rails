class Payment < ApplicationRecord
  has_many :challenges
  has_many :users, through: :challenges
  has_many :wagers, through: :challenges

  validates :name, presence: true  

  scope :order_by_name, -> {order(name: :asc)}

end
