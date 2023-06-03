class OrderSerializer
  include JSONAPI::Serializer
  attributes :total, :status, :user_id
  
  attribute :order_date do |o|
    o.created_at
  end  
  belongs_to :user
end
