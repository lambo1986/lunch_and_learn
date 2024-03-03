class CountryService

  def countries
    Rails.cache.fetch("countries", expires_in: 12.hours) do
      get_url("https://restcountries.com/v3.1/all")
    end
  end

  def random_country
    countries.sample[:name][:common]
  end

  private

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
