class CountrySerializer

  include JSONAPI::Serializer

  set_id { nil }
  set_type :countries

  attributes :name, :capital, :independent, :status

  attribute :capital_coords do |object|
    object.coords
  end
end
