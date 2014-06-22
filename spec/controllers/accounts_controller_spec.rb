require 'rails_helper'

describe AccountsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  context 'standard users' do
    { new: :get, create: :post, update: :put,
      destroy: :delete }.each do |action, method|

      it "cannot access #{action} action" do
        sign_in(create(:user))

        send(method, action, id: create(:account))

        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eql(
          "Check ya' self before ya' wreck yo' self; Admins only!")
      end
    end
  end
end
