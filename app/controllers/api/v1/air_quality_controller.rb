class Api::V1::AirQualityController < ApplicationController

  def index
    if params[:country].present?
      capital = CountryService.new.capital_of(params[:country])
    else
      rando_country = CountryService.new.random_country
      capital = CountryService.new.capital_of(rando_country)
    end
    coords = CoordsFacade.new.find_coords(capital)
    air_quality = PollutionFacade.new.pollution_at_coords(coords.first, coords.last)
    render json: AirQualitySerializer.new(air_quality).serializable_hash
  end
end
