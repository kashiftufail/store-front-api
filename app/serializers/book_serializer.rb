class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :isbn, :year_published, :price, :reviews, :created_at


  belongs_to :author
  belongs_to :supplier
end
