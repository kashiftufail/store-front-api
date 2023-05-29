class Book < ApplicationRecord
  belongs_to :supplier, counter_cache: true
  belongs_to :author, counter_cache: true
  has_many :book_orders
  has_many :orders, through: :book_orders
end
