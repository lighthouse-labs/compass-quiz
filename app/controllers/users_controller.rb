class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    password = SecureRandom.urlsafe_base64(16)
    @user.password = password
    if @user.save
      redirect_to users_url, notice: "The user #{@user.name} was successfully created with a generated password of \"#{password}\"."
    else
      @users = User.all
      render :index
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: "The user #{@user.name} was successfully destroyed."
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
