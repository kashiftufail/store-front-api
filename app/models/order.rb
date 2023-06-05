class Order < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :book_orders
  has_many :books, through: :book_orders

  enum :status, { being_packaged: 0, shipped: 1, complete: 2, canceled: 3 }, suffix: true

  def self.put_order(*args)
    books = Book.where(id: args[1]) 
    
    if books.present?
      subtotal = books.map(&:price).sum 
      shipping = 0 # todo make it accordingly currently 0
      total = subtotal + shipping      
      total_c =  StripeHandle.dollars_to_cents(total)
      order = Order.create(total: total, subtotal: subtotal, 
                        shipping: shipping, user_id: args[0])                       
      StripeHandle.create_charge(customer_id: args[2], amount: total_c, 
                                 description:'any words', currency: 'usd')                  
      order.books << books
    else       
      return 
    end
    
    order
  end
  
end
