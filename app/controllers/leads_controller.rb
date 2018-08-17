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
    @company = Company.new
  end

  def create
    @company = Company.create(params[:company_attributes])
    @lead = Lead.create(lead_params)
    if @lead.save!
      redirect_to user_leads_url(@user)
    else
      raise.inspect.params
    end
    # if @lead.save
    #   redirect_to user_leads_url(@user)
    # else
    #   render :new
    # end
  end


  private

  helper_method :set_user
    def set_user
      @user = User.find(session[:user_id])
    end

    def lead_params
      params.require(:lead).permit(
        :user_id,
        :status,
        :point_person,
        :phone_number,
        :email,
        :position,
        :created_on,
        :applied_on,
        company_attributes: [:name, :description, :website, :city]
      )
    end
end
