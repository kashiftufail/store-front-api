class Profile < ApplicationRecord
  include Image
  belongs_to :user
end  