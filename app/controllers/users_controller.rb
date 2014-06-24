class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Account created'
      redirect_to root_path
    else
      flash[:error] = 'Account not created'
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:handle, :password, :password_confirmation)
    end
end
