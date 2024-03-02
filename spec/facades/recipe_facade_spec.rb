require "rails_helper"

RSpec.describe RecipeFacade, vcr: true do
  describe "#by_country" do
    it "returns a list of recipes for a country" do
      recipes = RecipeFacade.new.by_country("kenya")

      expect(recipes).to be_a(Array)
      expect(recipes.first).to be_a(Recipe)
    end
  end
end
