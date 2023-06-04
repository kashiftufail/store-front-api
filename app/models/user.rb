class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  include StripeHandle
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_one :profile, dependent: :destroy   
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy       

  enum :role_type, { customer: 0, admin: 1 }, suffix: true

  after_create :create_stripe_customer

  def create_stripe_customer
    s = StripeHandle.create_customer(email: self.email)  
    self.update(stripe_customer_id: s.id)
  end  

  def self.attach_card_to_stripe_customer(*args)
    begin
      token = StripeHandle.create_token(card_no: args.last[:card_no], exp_year: args.last[:exp_year],
                                        exp_month: args.last[:exp_month], cvc: args.last[:cvc])        
      # attach card to stripe customer
        source = Stripe::Customer.create_source(
                    args.first,
                    {source: token.id},
                 )                                                                                  
    rescue Stripe::CardError => error
      error # card invalid message return. 
    end                                     
  end    

end
