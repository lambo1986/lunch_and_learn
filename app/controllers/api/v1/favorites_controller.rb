class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_user_api_key, only: [:index, :create, :destroy]

  def index
    cache_key = "user_#{@_current_user.id}_favorites"
    favorites = Rails.cache.fetch(cache_key, expires_in: 1.hour) do
      @_current_user.favorites.to_a
    end
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

  def destroy
    begin
      favorite = @_current_user.favorites.find(params[:id])
      favorite.destroy
      render json: { message: "Favorite destroyed" }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Favorite not found!" }, status: :not_found
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end
