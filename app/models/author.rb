class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end
