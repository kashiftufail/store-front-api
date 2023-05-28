class Review < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :book
end
