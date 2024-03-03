class PollutionFacade

  def pollution_at_coords(longitude, latitude)
    service = PollutionService.new
    call = service.pollution(longitude, latitude)
    Pollution.new(call)
  end
end
