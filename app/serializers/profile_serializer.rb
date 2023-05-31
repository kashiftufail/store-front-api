class ProfileSerializer
  include JSONAPI::Serializer
  attributes :city, :state, :zip, :address, :user_id

  belongs_to: user
end
