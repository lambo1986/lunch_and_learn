class CoordsService

  def get_coords(city)
    get_url("direct?q=#{city}&limit=1")
    .first
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://api.openweathermap.org/geo/1.0/") do |faraday|
      faraday.params[:appid] = Rails.application.credentials.api_key[:weather][:weather_key]
    end
  end
end
