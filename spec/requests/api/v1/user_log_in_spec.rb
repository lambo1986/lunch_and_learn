require "rails_helper"

RSpec.describe "User Session", type: :request do
  describe "POST /api/v1/sessions" do
    it "creates a new user session" do
      user = User.create!(name: "George E. Boy", email: "coolby@thousands.com", password: "fghjkl", password_confirmation: "fghjkl")
      post "/api/v1/sessions", params: {
        email: user.email,
        password: "fghjkl"
      }.to_json, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json_response["data"]["attributes"]["api_key"]).not_to be_nil
    end

    it "fails to create a new user session if password is not correct" do
      user = User.create!(name: "George E. Boy", email: "coolby@thousands.com", password: "fghjkl", password_confirmation: "fghjkl")
      post "/api/v1/sessions", params: {
        email: user.email,
        password: "pass123"
      }.to_json, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(401)
      expect(json_response["error"]).to eq("Invalid email or password")
    end

    it "fails to create a new user session if email is not correct" do
      user = User.create!(name: "George E. Boy", email: "coolby@thousands.com", password: "fghjkl", password_confirmation: "fghjkl")
      post "/api/v1/sessions", params: {
        email: "jerryjerry@dingleboy.com",
        password: "fghjkl"
      }.to_json, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(401)
      expect(json_response["error"]).to eq("Invalid email or password")
    end
  end
end
