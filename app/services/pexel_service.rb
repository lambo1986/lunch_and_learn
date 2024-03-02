class PexelService
  def images(country)
    get_url("search?query=#{country}&size=medium&per_page=10")
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
