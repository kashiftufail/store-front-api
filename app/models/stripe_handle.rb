module StripeHandle
  def self.create_customer(email:, description: 'book store payment')
    Stripe::Customer.create(email: email,description: description)
  end

  def self.create_charge(customer_id:, amount:, description:)
    Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: description,
      currency: 'usd'
    )
  end

  def self.create_token(card_no:, exp_month:, exp_year:, cvc:)
    Stripe::Token.create(
      card: {
        number: card_no,
        exp_month: exp_month,
        exp_year: exp_year,
        cvc: cvc,
      }
    )
  end  

  # c = 


end
