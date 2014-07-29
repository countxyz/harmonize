class UsersController < ApplicationController
  before_action :require_signin!, except: :new
  before_action :set_user, only: [:edit, :update, :show, :stats]

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

  def update
    if @user.update(user_params)
      flash[:notice] = 'User updated'
      redirect_to admin_users_path
    else
      flash[:alert] = 'User not updated'
      render action: 'edit'
    end
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:handle, :password, :password_confirmation,
        :avatar)
    end
end
