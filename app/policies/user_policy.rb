class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user, @user = current_user, model
  end

  def index
    @current_user.admin?
  end
end
