class MerchantItemsSerializer
  include JSONAPI::Serializer
  attributes :name, :items

  # has_many :items
end
