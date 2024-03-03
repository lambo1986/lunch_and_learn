class Api::V1::RecipesController < ApplicationController

  def index
    country = params[:country]
    cache_key = "recipes_#{country}"
    recipes = Rails.cache.fetch(cache_key, expires_in: 2.hours) do
      RecipeFacade.new.by_country(country)
    end
    render json: RecipeSerializer.new(recipes).serializable_hash.to_json
  end
end
