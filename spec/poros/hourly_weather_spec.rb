require 'rails_helper'

describe HourlyWeather do
  describe 'class methods' do
    it 'initialize' do
      base = {
        dt: Faker::Number.number(digits: 10),
        temp: 75.2,
        weather: [{
          description: "cloudy",
          icon: "04d"
        }]
      }
      offset = -21600

      weather = HourlyWeather.new(base, offset)
      expect(weather).to be_a(HourlyWeather)
      expect(weather.temperature).to be_a(Float)
      expect(weather.temperature).to eq(base[:temp])
      expect(weather.time).to be_a(String)
      expect(weather.conditions).to be_a(String)
      expect(weather.icon).to be_a(String)
      expect(weather.conditions).to eq(base[:weather][0][:description])
      expect(weather.icon).to eq(base[:weather][0][:icon])
      expect(weather.conditions).to_not eq(weather.icon)
    end
  end
end
