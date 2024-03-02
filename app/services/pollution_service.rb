class PollutionService
  def initialize
    @pollution_base = "http://api.openweathermap.org/data/2.5/air_pollution"
    @weather_key = Rails.application.credentials.api_key[:weather]
  end

  def pollution(lat, lon)
    data = get_url("#{@pollution_base}?lat=30&lon=90&appid=#{@weather_key}")
  end

  private

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
