class Author < ApplicationRecord
  include Image
  has_many :books, dependent: :destroy
end
