class CountryService

  def countries
    get_url("all")
  end

  def capital_of(country)
    data = get_url("name/#{country}?fullText=true")
    data.first[:capital].first
  end

  def random_country
    countries.sample[:name][:common]
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://restcountries.com/v3.1/")
  end
end
