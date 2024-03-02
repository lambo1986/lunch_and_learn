require "rails_helper"

RSpec.describe "Api::V1::CountriesController", vcr: true, type: :request do
  describe "GET /api/v1/learning_resources?country=mongolia" do
    it "is the country show page and the endpoint returns a single collection of data for that country" do
      get "/api/v1/learning_resources?country=mongolia"

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json_response["data"]["type"]).to eq("learning_resource")
    end
  end
end
