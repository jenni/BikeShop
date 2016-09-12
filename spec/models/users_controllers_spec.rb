require 'rails_helper'

describe UsersController, :type => :controller do

  let(:user) { User.create!(email: 'peter2@example.com', password: '1234567890') }


  describe 'GET #show' do
     context 'User is logged in' do
      sign_in user
     end

     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, id: user.id
         expect(response).to redirect_to(root_path)
       end
     end
  end

end