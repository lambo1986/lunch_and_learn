class Image
  attr_reader :url, :tag
  def initialize(attrs)
    @url = attrs[:url]
    @tag = attrs[:src][:original]
  end
end
