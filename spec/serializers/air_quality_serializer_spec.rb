require "rails_helper"

RSpec.describe AirQualitySerializer, type: :serializer do
  it 'correctly converts aqi to readable_aqi' do
    expect(AirQualitySerializer.readable_aqi(1)).to eq("Good")
    expect(AirQualitySerializer.readable_aqi(2)).to eq("Fair")
    expect(AirQualitySerializer.readable_aqi(3)).to eq("Moderate")
    expect(AirQualitySerializer.readable_aqi(4)).to eq("Poor")
    expect(AirQualitySerializer.readable_aqi(5)).to eq("Very Poor")
    expect(AirQualitySerializer.readable_aqi(6)).to eq("Unknown")
  end
end
