require "rails_helper"

RSpec.describe PollutionFacade, vcr: true do
  describe "#pollution_at_coords" do
    it "returns pollution data at given coordinates" do
      pollution_data = PollutionFacade.new.pollution_at_coords(30, 75)

      expect(pollution_data).to be_a(Pollution)
    end
  end
end
