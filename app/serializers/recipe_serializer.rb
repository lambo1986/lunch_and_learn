class RecipeSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type "recipe"

  attributes :title, :url, :image
end
