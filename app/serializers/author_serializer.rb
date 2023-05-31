class AuthorSerializer
  include JSONAPI::Serializer
  attributes :title, :full_name, :created_at  

  attribute :image_url do |author|
    author.get_image_url if author.image.attached?
  end

  has_many :books

end
