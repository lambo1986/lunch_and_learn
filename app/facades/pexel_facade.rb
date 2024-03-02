class PexelFacade
  def image_search(country)
    service = PexelService.new
    call = service.images(country)
    call[:photos].map { |image| Image.new(image) }
  end
end
