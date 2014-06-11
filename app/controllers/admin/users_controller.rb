class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'User created'
      redirect_to admin_users_path
    else
      flash.now[:alert] = 'User not created'
      render action: 'new'
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      flash[:notice] = 'User updated'
      redirect_to admin_users_path
    else
      flash[:alert] = 'User not updated'
      render action: 'edit'
    end
  end

  def destroy
    if @user == current_user then flash[:alert] = 'Cannot delete thyself!'
    else
      @user.destroy
      flash[:notice] = 'User deleted'
    end
    redirect_to admin_users_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:handle, :first_name, :last_name, :password,
        :password_confirmation, :admin)
    end
end
