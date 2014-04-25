class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(:handle => params[:signin][:handle]).first

    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:error] = 'Unsuccessful sign in'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_url
  end
end
