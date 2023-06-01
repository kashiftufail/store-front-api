class ProfileSerializer
  include JSONAPI::Serializer
  attributes :city, :state, :zip, :address, :user_id

  attribute :image_url do |profile|
    profile.get_image_url if profile.image.attached?
  end

  belongs_to :user
end
