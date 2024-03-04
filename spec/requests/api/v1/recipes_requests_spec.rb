require "rails_helper"

RSpec.describe "Api::V1::Recipes", vcr: true, type: :request do
  describe "get /api/v1/recipes?country=poland" do
    it "returns recipes for Poland" do
      VCR.use_cassette("poland_recipes") do
        get "/api/v1/recipes?country=poland"

        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response).to_not be_empty
        expect(json_response["data"].count).to eq 20
      end
    end

    it "returns a list of recipes from a random country if no country is input" do
      get "/api/v1/recipes?country="

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json_response["data"].first["type"]).to eq("recipe")
    end

    it "returns an empty array if no recipes are found" do
      get "/api/v1/recipes?country=dhgsf"

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json_response["data"]).to eq([])
    end

    it "returns an empty array if empty string is passed as country" do
      get "/api/v1/recipes?country=___ "

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json_response["data"]).to eq([])
    end
  end
end
