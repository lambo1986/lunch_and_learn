require "rails_helper"

RSpec.describe "Api::V1::CountriesController", vcr: true, type: :request do
  describe "GET /api/v1/learning_resources?country=mongolia" do
    it "is the country show page and the endpoint returns a single collection of data for that country (image and video)" do
      get "/api/v1/learning_resources?country=mongolia"

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json_response["data"]["type"]).to eq("learning_resource")
    end

    it "returns an empty array for images if none are found" do
      get "/api/v1/learning_resources?country="

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json_response["data"]["attributes"]["images"]).to eq([])
    end

    it "returns an empty hash for video if not are found" do
      get "/api/v1/learning_resources?country=Lambertson Kingdom"

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json_response["data"]["attributes"]["video"]).to eq({})
    end
  end

  describe "GET /api/v1/random_country" do
    it "returns a random country" do
      get "/api/v1/random_country"

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json_response["data"]["attributes"]["name"]).to be_a(String)
    end
  end
end
