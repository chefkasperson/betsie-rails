class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :wager
  belongs_to :payment
  belongs_to :challenger, class_name: "User"

  accepts_nested_attributes_for :wager, reject_if: proc {|att| att['name'].blank?}
  accepts_nested_attributes_for :payment, reject_if: proc {|att| att['url'].blank? }

  validates :date, presence: true

  def new_from_form(params)
      self.user_id = params[:user_id]
      self.challenger_id = params[:challenger_id]
      self.wager_id = wager_params_select(params)
      self.payment_id = payment_params_select(params)
      self.date = params[:date]
      self
  end

  def wager_params_select(params)
    if !params['wager_attributes']['name'].blank?
      wager = Wager.find_or_create_by(name: params['wager_attributes']['name'])
      wager.id
    else
      params['wager_id']
    end
  end
  
  def payment_params_select(params)
    if !params['payment_attributes']['name'].blank?
      payment = Payment.find_or_create_by(name: params['payment_attributes']['name'])
      payment.id
    else
      params['payment_id']
    end
  end

  def update_status
    if self.status == "pending"
      self.status = "accepted"
    elsif self.status == "accepted"
      self.status = "completed"
    else
      self.status = "pending"
    end
  end
  
  def contestants
    c = []
    c << User.find_by_id(self.user_id)
    c << User.find_by_id(self.challenger_id)
    c
  end

  def winners_name
    if self.winner == 0
      "undecided"
    else
      User.find_by_id(self.winner).username
    end
  end

  def losers_name
    if self.winner == 0
      "undecided"
    elsif self.winner == self.user_id
      self.challenger.username
    elsif self.winner == self.challenger_id
      self.user.username
    else
      self.winner = 0
    end
  end 

end
