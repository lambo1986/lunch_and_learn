class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_user_api_key, only: [:index, :create]

  def index
    favorites = @_current_user.favorites
    render json: FavoritesSerializer.new(favorites).serializable_hash.to_json
  end

  def create
    favorite = @_current_user.favorites.new(favorite_params)

    if favorite.save
      render json: { success: "Favorite created successfully!" }, status: :created
    else
      render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end
