class PexelService

  def images(country)
    Rails.cache.fetch("pexels_images_#{country}", expires_in: 12.hours) do
      get_url("search?query=#{country}&size=medium&per_page=10")
    end
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.pexels.com/v1/') do |faraday|
      faraday.headers['Authorization'] = Rails.application.credentials[:api_key][:pexel]
    end
  end
end
