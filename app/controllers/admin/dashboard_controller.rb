class Admin::DashboardController < ApplicationController

  def index
    @accounts, @users = Account.all, User.all
  end
end
