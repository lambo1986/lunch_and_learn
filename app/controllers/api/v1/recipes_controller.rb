class Api::V1::RecipesController < ApplicationController
  
  def index
    country = params[:country]
    recipes = RecipeFacade.new.by_country(country)
    render json: RecipeSerializer.new(recipes).serializable_hash.to_json
  end
end
