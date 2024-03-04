class Api::V1::AirQualityController < ApplicationController

  def index
    capital = CountryService.new.capital_of(params[:country])
    coords = CoordsFacade.new.find_coords(capital, nil)
    air_quality = PollutionFacade.new.pollution_at_coords(coords.first, coords.last)
    render json: AirQualitySerializer.new(air_quality).serializable_hash
  end
end
