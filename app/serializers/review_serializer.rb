class ReviewSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :ratings, :user_id, :book_id, :is_available
  
  belongs_to :user
end
