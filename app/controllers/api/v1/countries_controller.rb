class Api::V1::CountriesController < ApplicationController

  def show
    country_name = params[:country]
    video = YoutubeDataFacade.new.one_country(country_name)
    images = PexelFacade.new.image_search(country_name)

    resource_data = {
      video: video,
      images: images,
      country: country_name
    }

    render json: ImageVideoSerializer.new(resource_data).serializable_hash.to_json
  end

  def random_country
    country = CountryFacade.new.random
    render json: CountrySerializer.new(country).serializable_hash.to_json
  end
end
