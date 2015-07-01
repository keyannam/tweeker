class TweeksController < ApplicationController
  before_action do
    @tweek = Tweek.order("created_at desc").page params[:page]
    authenticate_user
  end

  def create
    @tweek = Tweek.new params.require(:tweek).permit(:content)
    @tweek.user = @current_user
      if @tweek.save
        redirect_to dashboard_path, notice: "You just tweeked!"
      else
        render :dashboard
      end

  end
end
