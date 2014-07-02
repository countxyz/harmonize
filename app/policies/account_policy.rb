class AccountPolicy < ApplicationPolicy
  attr_reader :user, :account

  def initialize(user, account)
    @user, @account = user, account
  end
end
