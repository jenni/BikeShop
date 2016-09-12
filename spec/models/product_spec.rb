require 'rails_helper' 

describe Product do

    context "when the product has comments" do # create context
      before do # before running the test...
        @product = Product.create!(:name => "race bike")
        @user = User.create(:email => "123@123.com", :password => "12345678" )
        @product.comments.create!(:rating => 1, :user => @user, :body => "Perfect!")
        @product.comments.create!(:rating => 3, :user => @user, :body => "It´s okay")
        @product.comments.create!(:rating => 5, :user => @user, :body => "Awful bike!")
      end

      it 'returns the average rating of all comments' do
        expect(@product.average_rating).to eq 3
      end
    end

    context "when product has no name" do
      before do
        @product = Product.create(:description => "This is a test bike")
      end

      it 'is an invalid product' do
        expect(@product).not_to be_valid
      end
    end
end 

