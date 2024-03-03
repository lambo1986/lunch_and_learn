require "rails_helper"

RSpec.describe PollutionService, vcr: true, type: :service do
  describe "#pollution" do
    it "returns a hash" do
      data = PollutionService.new.pollution(30, 90)

      expect(data).to be_a(Hash)
      expect(data).to_not include({:cod=>"404", :message=>"Internal error"})
      expect(data).to_not include({:cod=>401, :message=>"Invalid API key. Please see https://openweathermap.org/faq#error401 for more info."})
    end
  end
end
