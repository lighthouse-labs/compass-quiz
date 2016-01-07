class ProfilesController < ApplicationController

  before_action :load_user

  def show
  end

  def update
    if @user.update(profile_params)
      redirect_to profile_path
    else
      render :show
    end
  end

  protected

  def load_user
    @user = current_user
  end

  def profile_params
    params.require(:user).permit(:password, :password_confirmation, :name, :email)
  end

end
