require "rails_helper"

RSpec.describe CoordsFacade, vcr: true do
  describe "#find_coords" do
    it "finds coords" do
      coords = CoordsFacade.new.find_coords("New Orleans")

      expect(coords).to be_an(Array)
      expect(coords.first).to be_a(Float)
      expect(coords.last).to be_a(Float)
    end
  end
end
