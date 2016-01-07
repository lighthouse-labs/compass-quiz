class SessionsController < ApplicationController

  layout 'public'

  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    redirect_to :root if current_user
  end

  def create
    if (user = User.find_by(email: params[:email]).try(:authenticate, params[:password]))
      session[:user_id] = user.id
      redirect_to :root
    else
      session[:email] = params[:email]
      redirect_to new_session_url, notice: 'Invalid email or password.'
    end
  end

  def destroy
    reset_session
    cookies.delete :user_id
    redirect_to :root
  end

end
