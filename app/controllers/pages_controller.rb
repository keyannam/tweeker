class PagesController < ApplicationController

  before_action do
    authenticate_user
  end

  def index
  end

  def dashboard
    @tweek = Tweek.new
    ids_of_my_followers = @current_user.following_users.pluck(:id)
    # @users = User.all.where("id! = ?", @current_user.id)
    timeline = ids_of_my_followers << @current_user.id
    @tweeks = Tweek.where(user_id: timeline).order("created_at DESC").page params[:page]
    @users = User.all
                 .reject {|u| @current_user.following? u}
                 .reject {|u| @current_user == u}

  end
end
