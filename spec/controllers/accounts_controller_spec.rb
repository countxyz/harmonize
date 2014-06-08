require 'rails_helper'

describe AccountsController, type: :controller do

  context 'standard users' do

    it 'cannot access new action' do
      signin_authentication
      get :new

      expect(response).to redirect_to('/accounts')
      expect(flash[:alert]).to eql(
        "Check ya' self before ya' wreck yo' self; Admins only!")
    end
  end
end
