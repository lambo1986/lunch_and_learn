class CoordsFacade

  def find_coords(city)
    service = CoordsService.new
    call = service.get_coords(city)
    coords = [] << call[:lat] << call[:lon]
  end
end
