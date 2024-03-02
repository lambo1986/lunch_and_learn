class YoutubeDataService
  def get_videos_for_country(country)#(Mr. History)
    get_url("?&part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}&type=video")
  end

  private

  def get_url(url)
    response = conn.get(url)
    if response.status == 200
      data = JSON.parse(response.body, symbolize_names: true)
      data[:items]
    else
      { error: "API request failed", status: response.status, body: response.body }
    end
  end


  def conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/search") do |faraday|
      faraday.params[:key] = Rails.application.credentials.api_key[:youtube_data]
    end
  end
end
