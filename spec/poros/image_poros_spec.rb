require "rails_helper"

RSpec.describe Image do
  it "exists" do
    attrs = {
      url: "http://example.com/image.png",
      src: {
        original: "watch the camels walk in the hot sun",
      }
    }
    image = Image.new(attrs)

    expect(image.url).to eq("http://example.com/image.png")
    expect(image.tag).to eq("watch the camels walk in the hot sun")
  end
end
