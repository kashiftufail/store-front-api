class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at
  set_type :user
  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end


end
