class UsersController < ApplicationController

  before_action do
    authenticate_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:username, :password, :password_confirmation)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      end
  end

  def follow
    user = User.find params[:id]
      @current_user.follow user
        redirect_to root_path
  end

  def delete
    user = User.find params[:id]
    @current_user.stop_following user
    redirect_to root_path
  end
end
