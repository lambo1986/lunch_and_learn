require "rails_helper"

RSpec.describe "Api::V1::Recipies", vcr: true, type: :request do
  describe "get /api/v1/recipes?country=poland" do
    it "returns a list of recipes" do
      get "/api/v1/recipes?country=poland"

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json_response["data"].count).to eq 20
    end
  end
end
