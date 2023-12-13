Rails.configuration.stripe = { 
  :publishable_key => 'pk_test_DE50VU67vGDSRJFfX61CyvEY',
  :secret_key => 'sk_test_91AQU1AfwGDtGxq2mXe2IyR4'
} 
Stripe.api_key = Rails.configuration.stripe[:secret_key]