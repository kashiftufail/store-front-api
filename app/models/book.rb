class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author
  has_many :book_orders
  has_many :orders, through: :book_orders
end
