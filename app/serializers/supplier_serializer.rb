class SupplierSerializer
  include JSONAPI::Serializer
  attributes :full_name, :created_at

  has_many :books
end
