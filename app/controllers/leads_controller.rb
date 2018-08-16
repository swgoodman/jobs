class LeadsController < ApplicationController
  before_action :set_user

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @leads = @user.leads
    else
      redirect_to root_path
    end
  end

  def new
    @lead = Lead.new(user_id: params[:user_id])
  end

  def create
    @lead = Lead.new(lead_params)
  end


  private

  helper_method :set_user
    def set_user
      @user = User.find(session[:user_id])
    end

    def lead_params
      params.require(:lead).permit(:company, :position, :user_id)
    end
end
