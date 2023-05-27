class OrderSerializer
  include JSONAPI::Serializer
  attributes :date_submited, :total, :status, :user_id
  
  belongs_to :user
end
