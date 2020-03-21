class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :omniauth, :welcome]

  def welcome
  end
  
  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = "Sorry, the login information was incorrect. Please try again"
      render 'new'
    end
  end

  def destroy 
    session.delete(:user_id)
    redirect_to '/'
  end

  def omniauth
    user = User.find_or_create_by(username: auth['info']['email']) do |u|
      u.password = SecureRandom.hex
    end
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end