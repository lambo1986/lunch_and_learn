class PollutionService

  def pollution(lat, lon)
    get_url("?lat=#{lat}&lon=#{lon}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/air_pollution") do |faraday|
      faraday.params[:appid] = Rails.application.credentials.api_key[:weather][:weather_key]
    end
  end
end
