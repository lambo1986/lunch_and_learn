class Video
  attr_reader :title, :video_id
  def initialize(attrs)
    @title = attrs[:snippet][:title]
    @video_id = attrs[:id][:videoId]
  end
end
