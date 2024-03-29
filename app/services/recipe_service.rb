class RecipeService

  def get_rando_recipes_for_country(country)
    Rails.cache.fetch("rando_recipes_for_#{country}", expires_in: 12.hours) do
      recipes = get_url("/api/recipes/v2?q=#{country}&type=public&random=true")
    end
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.params["app_id"] = Rails.application.credentials.api_key[:recipes_id]
      faraday.params["app_key"] = Rails.application.credentials.api_key[:recipes]
    end
  end
end
