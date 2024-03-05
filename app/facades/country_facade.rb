class CountryFacade

  def all
    service = CountryService.new
    call = service.countries
    call.map { |country| Country.new(country) }
  end

  def random
    all.sample
  end
end
