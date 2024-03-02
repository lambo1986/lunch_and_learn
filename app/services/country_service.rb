class CountryService
  def countries
    countries = get_url("https://restcountries.com/v3.1/all")
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
