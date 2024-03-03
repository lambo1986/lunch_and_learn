class PexelFacade

  def image_search(country)
    service = PexelService.new
    call = service.images(country)
    if call[:photos].nil?
      []
    else
      call[:photos].map { |image| Image.new(image) }
    end
  end
end
