class AccountsController < ApplicationController
  before_action :require_signin!
  before_action :set_account, only: [:show]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def show; end

  private

    def account_params
      params.require(:account).permit(:name, :email, :website, :phone, :fax)
    end
end
