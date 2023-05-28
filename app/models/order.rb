class Order < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :book_orders
  has_many :books, through: :book_orders
end
