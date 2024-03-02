require "rails_helper"

RSpec.describe CountryService, vcr: true, type: :service do
  describe "#countries" do
    it "returns a list of countries" do
      countries = CountryService.new.countries

      expect(countries).to be_a(Array)
      expect(countries.first).to be_a(Hash)
      expect(countries.first[:name][:common]).to be_a(String)
    end
  end

  describe "#random_country" do
    it "returns a random country as a string for use as a search param" do
      country = CountryService.new.random_country

      expect(country).to be_a(String)
    end
  end
end
