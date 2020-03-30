class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:update, :accept]

  def new
    @user = User.find_by(id: params[:user_id])
    @challenge = Challenge.new
    @challenge.build_wager
    @challenge.build_payment
  end

  def create
    @challenge = Challenge.new
    @challenge.new_from_form(challenge_params)
    # @challenge.user_id = current_user.id
    if @challenge.save
      redirect_to user_challenges_path(current_user)
    else
      render 'new'
    end
  end

  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @challenges = @user.challenges
      @challenges_from_others = @user.challenges_from_others
    else
      @challenges = Challenge.search(params[:search])
    end
  end

  def accept
    @challenge.update_status
    @challenge.save
    redirect_to challenge_path(@challenge)
  end

  def update
    @challenge.winner = params[:challenge][:winner]
    @challenge.update_status
    @challenge.save
    redirect_to challenge_path(@challenge)
  end

  def show
    if set_challenge
      check_current_user
      @contestants = @challenge.contestants
    else
      redirect_to challenges_path
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:date, :status, :winner, :search, :user_id, :challenger_id, :wager_id, :payment_id, wager_attributes: [:name], payment_attributes: [:name])
  end

  def set_challenge
    @challenge = Challenge.find_by_id(params[:id])
  end

  def check_current_user
    if current_user.id != @challenge.user_id  && current_user.id != @challenge.challenger_id
      redirect_to user_challenges_path(current_user), notice: "You may only view your challenges"
    end
  end
end