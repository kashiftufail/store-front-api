class Supplier < ApplicationRecord
  has_many :books, dependent: :destroy
end
