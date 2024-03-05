class CountryService

  def countries
    Rails.cache.fetch("countries", expires_in: 12.hours) do
      get_url("https://restcountries.com/v3.1/all")
    end
  end

  def random_country
    country = countries.sample[:name][:common]
    country if valid_country?(country)
  end

  def valid_country?(country)
    countries.any? { |c| c[:name][:common] == country }
  end

  private

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
