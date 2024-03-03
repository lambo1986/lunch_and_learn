class FavoritesSerializer
  include JSONAPI::Serializer

  set_type :favorite
  attributes :recipe_title, :recipe_link, :country, :created_at

  attribute :created_at do |object|
    object.created_at.iso8601(3)
  end
end
