require "rails_helper"

RSpec.describe "favorite recipes", type: :request do
  describe "POST /api/v1/favorites" do
    it "creates a new favorite that belongs to a user" do
      user = User.create!(name: "Hansi P. Schmultzta", email: "smk@oolk.net", password: "craf!3G", password_confirmation: "craf!3G")
      fav_params = {
        api_key: user.api_key,
        country: "Germany",
        recipe_link: "https://www.foodnetwork.com/recipe/123456",
        recipe_title: "Hot Sausage and Sour Kraut"
      }.to_json

      post "/api/v1/favorites", params: fav_params, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      expect(response).to have_http_status(:created)
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)["success"]).to eq("Favorite created successfully!")
    end

    it "fails to create a new favorite that belongs to a user if credentials wrong" do
      user = User.create!(name: "Hansi P. Schmultzta", email: "smk@oolk.net", password: "craf!3G", password_confirmation: "craf!3G")
      fav_params = {
        api_key: "please123",
        country: "Germany",
        recipe_link: "https://www.foodnetwork.com/recipe/123456",
        recipe_title: "Hot Sausage and Sour Kraut"
      }.to_json

      post "/api/v1/favorites", params: fav_params, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      expect(response).to have_http_status(:unauthorized)
      expect(response.status).to eq(401)
      expect(JSON.parse(response.body)["error"]).to eq("Invalid API Key!")
    end

    it "fails to create a new favorite that belongs to a user if unprocessable" do
      user = User.create!(name: "Hansi P. Schmultzta", email: "smk@oolk.net", password: "craf!3G", password_confirmation: "craf!3G")
      fav_params = {
        api_key: user.api_key,
        country: "",
        recipe_link: "",
        recipe_title: ""
      }.to_json

      post "/api/v1/favorites", params: fav_params, headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      errors = JSON.parse(response.body)["errors"]

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.status).to eq(422)
      expect(errors).to include("Country can't be blank", "Recipe link can't be blank", "Recipe title can't be blank")
    end
  end

  describe "GET /api/v1/favorites" do
    it "returns all favorites belonging to a user when they have favorites" do
      user = User.create!(name: "Hansi P. Schmultzta", email: "smk@oolk.net", password: "craf!3G", password_confirmation: "craf!3G")
      favorite1 = user.favorites.create!(country: "Germany", recipe_link: "https://sdfsdfsdf.com", recipe_title: "Hot Sausage and Sour Kraut")
      favorite2 = user.favorites.create!(country: "Iceland", recipe_link: "https://sdfsdfsdf.vom/iceland", recipe_title: "Hot Soupy Stuff and Rotten Fish")

      get "/api/v1/favorites?api_key=#{user.api_key}", headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json_response["data"].first["type"]).to eq("favorite")
      expect(json_response["data"].first["attributes"]["recipe_title"]).to eq("Hot Sausage and Sour Kraut")
      expect(json_response["data"].last["attributes"]["recipe_title"]).to eq("Hot Soupy Stuff and Rotten Fish")
    end

    it "returns an empty array when a user has no favorites" do
      user = User.create!(name: "Hansi P. Schmultzta", email: "smk@oolk.net", password: "craf!3G", password_confirmation: "craf!3G")

      get "/api/v1/favorites?api_key=#{user.api_key}", headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json_response["data"].length).to eq(0)
      expect(json_response["data"]).to eq([])
    end

    it "is sad when the API key is wrong" do
      user = User.create!(name: "Hansi P. Schmultzta", email: "smk@oolk.net", password: "craf!3G", password_confirmation: "craf!3G")
      favorite1 = user.favorites.create!(country: "Germany", recipe_link: "https://sdfsdfsdf.com", recipe_title: "Hot Sausage and Sour Kraut")

      get "/api/v1/favorites?wrongkeydude", headers: { "Content-Type" => "application/json", "Accept" => "application/json" }

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:unauthorized)
      expect(response.status).to eq(401)
      expect(json_response["error"]).to eq("Invalid API Key!")
    end
  end
end
