require "rails_helper"

RSpec.describe PexelFacade, vcr: true do
  describe "#image_search" do
    it "returns an array of images" do
      images = PexelFacade.new.image_search("mongolia")

      expect(images).to be_a(Array)
      expect(images.first).to be_an(Image)
    end
  end
end
