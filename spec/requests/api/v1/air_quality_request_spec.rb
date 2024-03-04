require "rails_helper"

RSpec.describe "pollution requests", vcr: true, type: :request do
  describe "GET /api/v1/air_quality?country=India" do
    it "returns a list of air quality data for input country" do
      get "/api/v1/air_quality?country=India"

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json_response["data"]["attributes"]["readable_aqi"]).to be_a(String)
    end
  end
end
