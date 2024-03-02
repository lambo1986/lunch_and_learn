require "rails_helper"

RSpec.describe YoutubeDataFacade, vcr: true do
  describe "#one_country" do
    it "returns a video for a given country" do
      video = YoutubeDataFacade.new.one_country("mogolia")

      expect(video).to be_a(Video)
    end
  end
end
