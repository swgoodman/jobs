class LeadsController < ApplicationController
  before_action :set_user
  before_action :set_lead, only: [:edit, :update, :destroy]

  def index
    if current_user
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
      render :new
    end
    # if @lead.save
    #   redirect_to user_leads_url(@user)
    # else
    #   render :new
    # end
  end

  def edit
    set_lead
  end

  def update
    set_lead
  end

  def destroy
  end



  private

  helper_method :set_user
    def set_user
      @user = User.find(session[:user_id])
    end

    def set_lead
      @lead = Lead.find(params[:id])
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
