require "rails_helper"

RSpec.describe PollutionService, vcr: true, type: :service do
  describe "#pollution" do
    it "returns a hash" do
      poll = PollutionService.new.pollution(30, 90)

      expect(poll).to be_a(Hash)
    end
  end
end
