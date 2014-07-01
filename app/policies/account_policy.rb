class AccountPolicy
  attr_reader :user, :account

  def initialize(user, account)
    @user, @account = user, account
  end

  def create?
    user.admin?
  end
end
