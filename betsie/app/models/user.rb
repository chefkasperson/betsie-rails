class User < ApplicationRecord
  has_many :challenges
  has_many :wagers, through: :challenges
  has_many :payments, through: :challenges

  has_secure_password

  validates :username, uniqueness: true, presence: true


  def challenges_from_others
    Challenge.all.select {|c| c.challenger_id == self.id}
  end

  def user_record
    "Wins: #{user_wins.count} - Losses: #{user_losses.count}"
  end

  def user_completed_challenges
    self.challenges.select {|c| c.status == "completed"}
  end

  def user_wins
    self.challenges.select {|c| c.winner == self.id}
  end

  def user_losses
    user_completed_challenges - user_wins
  end

  scope :order_by_username, -> {order(username: :asc)}
end
