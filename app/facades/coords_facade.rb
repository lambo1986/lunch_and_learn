class CoordsFacade

  def find_coords(city, zip)
    service = CoordsService.new
    call = service.get_coords(city, zip)
    coords = [] << call[:lat] << call[:lon]
  end
end
