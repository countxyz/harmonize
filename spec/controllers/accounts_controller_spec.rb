require 'rails_helper'

describe AccountsController, type: :controller do

  context 'standard users' do
    { new: :get, create: :post, update: :put,
      destroy: :delete }.each do |action, method|

      it "cannot access #{action} action" do
        signin_authentication

        send(method, action, id: create(:account))

        expect(response).to redirect_to('/accounts')
        expect(flash[:alert]).to eql(
          "Check ya' self before ya' wreck yo' self; Admins only!")
      end
    end
  end
end
