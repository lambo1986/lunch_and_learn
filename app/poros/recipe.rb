class Recipe
  attr_reader :id, :type, :title, :url, :image
  def initialize(attrs)
    @id = nil
    @type = "recipe"
    @title = attrs[:recipe][:label]
    @url = attrs[:recipe][:url]
    @image = attrs[:recipe][:image]
  end
end
