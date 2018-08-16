class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to user_leads_url(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
