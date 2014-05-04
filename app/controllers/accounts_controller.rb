class AccountsController < ApplicationController
  before_action :require_signin!
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:notice] = 'Account created'
      redirect_to @account
    else
      flash[:error] = 'Account not created'
      redirect_to @account
    end    
  end

  def show; end

  def update
    if @account.update_attributes(contact_params)
      flash[:notice] = 'Account not updated'
      redirect_to @account
    else
      flash[:alert] = 'Account not updated'
      redirect_to @account
    end
  end
  
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to @account }
      format.js { head :no_content }
    end
  end

  private
    
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :email, :website, :phone, :fax,
        :notes)
    end
end
