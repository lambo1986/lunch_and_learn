require "rails_helper"

RSpec.describe Pollution do
  it "exists" do
    attrs = {
          "coord": {
              "lon": 90,
              "lat": 30
            },
          "list": [
              {
                  "main": {
                      "aqi": 1
                  },
                  "components": {
                      "co": 166.89,
                      "no": 0,
                      "no2": 0.63,
                      "o3": 54.36,
                      "so2": 0.04,
                      "pm2_5": 0.58,
                      "pm10": 1.48,
                      "nh3": 8.49
                  },
                  "dt": 1709484033
                }
              ]
            }
    pollution = Pollution.new(attrs)

    expect(pollution).to be_a(Pollution)
    expect(pollution.lon).to eql(90)
    expect(pollution.lat).to eql(30)
    expect(pollution.aqi).to eql(1)
    expect(pollution.co).to eql(166.89)
    expect(pollution.no).to eql(0)
    expect(pollution.no2).to eql(0.63)
    expect(pollution.o3).to eql(54.36)
    expect(pollution.so2).to eql(0.04)
    expect(pollution.pm2_5).to eql(0.58)
    expect(pollution.pm10).to eql(1.48)
    expect(pollution.nh3).to eql(8.49)
    expect(pollution.dt).to eql(1709484033)
  end
end
