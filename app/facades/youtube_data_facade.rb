class YoutubeDataFacade
  def one_country(country)
    service = YoutubeDataService.new
    call = service.get_videos_for_country(country)
    video = call.first
    Video.new(video)
  end
end
