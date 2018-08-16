class LeadsController < ApplicationController
  before_action :set_user

  def index
  end


  private

  helper_method :set_user
    def set_user
      @user = User.find(session[:user_id])
    end
end
