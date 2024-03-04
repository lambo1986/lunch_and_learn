require "rails_helper"

RSpec.describe CoordsService, vcr: true do
  describe "#get_coords" do
    it "returns a hash of coords from city and zip" do
      coords = CoordsService.new.get_coords("New Orleans")

      expect(coords).to be_a(Hash)
    end
  end
end
