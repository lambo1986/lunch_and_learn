require "rails_helper"

RSpec.describe "create a new user endpoint", type: :request do
  describe "POST /api/v1/users" do
    it "creates a new user in the database, returns api key" do
      headers = { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }
      post "/api/v1/users", params: {
        user: {
          name: "Jerry Flang",
          email: "pinebreeze@millionz.cloudflare.com",
          password: "shy_guy_23",
          password_confirmation: "shy_guy_23"
        }
      }.to_json, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(json_response["data"]["attributes"]["name"]).to eq("Jerry Flang")
    end

    it "fails to create a new user in the database, returns error if passwords don't match" do
      headers = { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }
      post "/api/v1/users", params: {
        user: {
          name: "George Glang",
          email: "pines@millionz.com",
          password: "shy_dude",
          password_confirmation: "shy_dudd"
        }
      }.to_json, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(422)
      expect(json_response["errors"]).to eq(["Password confirmation doesn't match Password"])
    end

    it "fails to create a new user in the database, returns error if email is taken" do
      User.create!(name: "George Glang", email: "pines@millionz.com", password: "fghjkl", password_confirmation: "fghjkl")
      headers = { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }
      post "/api/v1/users", params: {
        user: {
          name: "George Glang",
          email: "pines@millionz.com",
          password: "shy_dude",
          password_confirmation: "shy_dude"
        }
      }.to_json, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response.status).to eq(422)
      expect(json_response["errors"]).to eq(["Email has already been taken"])
    end
  end
end
