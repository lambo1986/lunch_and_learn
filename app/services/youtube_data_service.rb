class YoutubeDataService

  def get_videos_for_country(country)#(Mr. History)
    Rails.cache.fetch("youtube_videos_for_#{country}", expires_in: 12.hours) do
      get_url("?&part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}&type=video")
    end
  end

  private

  def get_url(url)
    response = conn.get(url)
    if response.status == 200
      data = JSON.parse(response.body, symbolize_names: true)
      data[:items]
    end
  end

  def conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/search") do |faraday|
      faraday.params[:key] = Rails.application.credentials.api_key[:youtube_data]
    end
  end
end
