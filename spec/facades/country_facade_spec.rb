require "rails_helper"

RSpec.describe CountryFacade, vcr: true do
  describe "#all" do
    it "returns a list of countries" do
      countries = CountryFacade.new.all

      expect(countries).to be_a(Array)
      expect(countries.first).to be_a(Country)
    end
  end

  describe "#random" do
    it "returns a random country" do
      facade = CountryFacade.new.random

      expect(facade).to be_a(Country)
    end
  end
end
