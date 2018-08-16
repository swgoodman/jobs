class LeadsController < ApplicationController
  before_action :set_user

  def index
  end

  def new
    @lead = Lead.new(user_id: params[:user_id])
  end

  def create
  end


  private

  helper_method :set_user
    def set_user
      @user = User.find(session[:user_id])
    end

    def post_params
      params.require(:lead).permit(:company, :position, :user_id)
    end
end
