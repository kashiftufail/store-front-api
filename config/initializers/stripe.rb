Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.dig(:stripe, :pk_key),
  :secret_key      => Rails.application.credentials.dig(:stripe, :sk_key)
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]