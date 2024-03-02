require "rails_helper"

RSpec.describe YoutubeDataService, vcr: true do
  describe "#get_videos_for_country" do
    it "returns an array of videos for the history of an input country" do
      videos = YoutubeDataService.new.get_videos_for_country("mongolia")

      expect(videos).to be_an(Array)
      expect(videos.first).to be_a(Hash)
      expect(videos.first[:kind]).to be_a(String)
    end
  end
end
