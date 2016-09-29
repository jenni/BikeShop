class PaymentsController < ApplicationController
	before_action :authenticate_user!

	def create
		#declaring instance variable to find product by reading hidden field's params in the stripe checkout button form.
		@product = Product.find(params[:product_id])
		#declaring instance variable to refer to the current user by using Devise helper.
		@user = current_user
		token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
  	charge = Stripe::Charge.create(
	      :amount => @product.price.to_i*100, # amount in cents, again
	      :currency => "eur",
	      :source => token,
	      :description => params[:stripeEmail]
	      )

  	if charge.paid
  		Order.create(
  			:product_id => @product,
  			:user_id => @user,
  			:total => @product.price
  			)

  		flash[:success] = "Payment successful"
  		redirect_to "payments/payment_successful.html.erb"
  		
  	end

  rescue Stripe::CardError => e
	      # The card has been declined
	      body = e.json_body
	      err = body[:error]
	      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	    end

    redirect_to product_path(@product) #redirects to product page

  end

end

