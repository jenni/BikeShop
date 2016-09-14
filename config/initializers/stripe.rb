if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Ht7SG3skQy8jHhCMnW5ZJeHf',
    :secret_key => 'sk_test_F1k4fUwi3ctwqu2bKswCxMWS'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]