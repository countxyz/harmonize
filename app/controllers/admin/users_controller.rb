class Admin::UsersController < Admin::BaseController

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

  private

    def user_params
      params.require(:user).permit(
        :handle, :password, :password_confirmation, :admin)
    end
end
