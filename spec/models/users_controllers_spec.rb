require 'rails_helper'

describe UsersController, :type => :controller do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }

  describe "GET #show" do
     context "User is logged in" do 
       before do
         sign_in user
       end

       it "loads the correct user details" do
         get :show, id: user.id
         expect(response.status).to eq 200
         expect(assigns(:user)).to eq user
       end
     end
     

     context "No user is logged in" do
       it "redirects to login" do
         get :show, id: user.id
         expect(response).to redirect_to(root_path)
       end
     end
  end

end