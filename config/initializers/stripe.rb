if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_c56deCcz0jAK61ISK5fnc5Xq00KsCYXWTE',
    secret_key: 'sk_test_1vSlGDNUEKfSYwrCKWOC7L7c00Dg6mqW2f'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
