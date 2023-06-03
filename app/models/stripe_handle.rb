module StripeHandle
  def self.create_customer(email:, description: 'book store payment')
    Stripe::Customer.create(email: email,description: description)
  end
end
