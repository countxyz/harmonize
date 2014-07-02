class AccountPolicy
  attr_reader :user, :account

  def initialize(user, account)
    @user, @account = user, account
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.admin?
  end

  def delete?
    destroy?
  end

  def destroy?
    user.admin?
  end
end
