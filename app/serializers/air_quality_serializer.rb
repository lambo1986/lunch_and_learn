class AirQualitySerializer
  include JSONAPI::Serializer

  set_type :air_quality
  set_id { nil }

  attribute :aqi
  attribute :datetime do |object|
    object.dt
  end

  attribute :readable_aqi do |object|
    readable_aqi(object.aqi)
  end

  private

  def self.readable_aqi(aqi)
    case aqi
    when 1
      'Good'
    when 2
      'Fair'
    when 3
      'Moderate'
    when 4
      'Poor'
    when 5
      'Very Poor'
    else
      'Unknown'
    end
  end
end
