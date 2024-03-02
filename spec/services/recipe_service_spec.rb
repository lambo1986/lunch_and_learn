require "rails_helper"

RSpec.describe RecipeService, vcr: true, type: :service do
  describe "#get_rando_recipes_for_country" do
    it "returns a randomized list of recipes for an input country" do
      service = RecipeService.new.get_rando_recipes_for_country("Norway")

      expect(service).to be_a(Hash)
    end
  end
end
