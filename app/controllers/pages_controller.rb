class PagesController < ApplicationController

  before_action do
    authenticate_user
  end

  def index
  end

  def dashboard
    ids_of_my_followers = @current_user.following_users.pluck(:id)
    @users = User.all.where("id! = ?", @current_user.id)
  end
end
