class UserSerializer
  
  include JSONAPI::Serializer

  set_type :user
  attributes :name, :email, :api_key
end
