class AuthorSerializer
  include JSONAPI::Serializer
  attributes :title, :full_name, :created_at

  has_many :books

end
