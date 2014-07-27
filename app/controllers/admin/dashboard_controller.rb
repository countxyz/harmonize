class Admin::DashboardController < ApplicationController

  def index
    @accounts = Account.all
  end
end
