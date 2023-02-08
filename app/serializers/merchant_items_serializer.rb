class MerchantItemsSerializer
  include JSONAPI::Serializer
  attributes :items

  # has_many :items
end
