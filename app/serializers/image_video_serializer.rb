class ImageVideoSerializer

  include JSONAPI::Serializer

  set_id { nil }
  set_type "learning_resource"

  attribute :country do |object|
    object[:country]
  end

  attribute :video do |object|
    if object[:video].nil? || object[:video] == {}
      {}
    else
      {
        title: object[:video].title,
        youtube_video_id: object[:video].video_id
      }
    end
  end

  attribute :images do |object|
    object[:images].map do |image|
      {
        alt_tag: image.tag,
        url: image.url
      }
    end
  end
end
