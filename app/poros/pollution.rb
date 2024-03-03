class Pollution

  attr_reader :lon, :lat, :aqi, :co, :no, :no2, :o3, :so2, :pm2_5, :pm10, :nh3, :dt

  def initialize(attrs)
    @lon = attrs[:coord][:lon]
    @lat = attrs[:coord][:lat]
    @aqi = attrs[:list].first[:main][:aqi]
    @co = attrs[:list].first[:components][:co]
    @no = attrs[:list].first[:components][:no]
    @no2 = attrs[:list].first[:components][:no2]
    @o3 = attrs[:list].first[:components][:o3]
    @so2 = attrs[:list].first[:components][:so2]
    @pm2_5 = attrs[:list].first[:components][:pm2_5]
    @pm10 = attrs[:list].first[:components][:pm10]
    @nh3 = attrs[:list].first[:components][:nh3]
    @dt = attrs[:list].first[:dt]
  end
end
