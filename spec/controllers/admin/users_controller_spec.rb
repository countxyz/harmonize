require 'rails_helper'

describe Admin::UsersController, type: :controller do

  context 'standard users' do

    it 'is unable to access the index action' do
      sign_in(create(:user))
      get 'index'
      expect(response).to redirect_to('/')
      expect(flash[:alert]).to eql(
        "Check ya' self before ya' wreck yo' self; Admins only!")
    end
  end
end
