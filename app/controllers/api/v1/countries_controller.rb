class Api::V1::CountriesController < ApplicationController
  def show
    country_name = params[:country]
    video = YoutubeDataFacade.new.one_country(country_name)
    images = PexelFacade.new.image_search(country_name)
    
  end
end
