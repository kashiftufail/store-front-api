class Order < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :book_orders
  has_many :books, through: :book_orders

  enum :status, { being_packaged: 0, shipped: 1, complete: 2, canceled: 3 }, suffix: true
end
