require 'rails_helper'

describe DailyWeather do
  describe 'class methods' do
    it 'initialize' do
      base = {
        dt: Faker::Number.number(digits: 10),
        sunrise: Faker::Number.number(digits: 10),
        sunset: Faker::Number.number(digits: 10),
        temp: {
          max: 75.2,
          min: 69.5
        },
        weather: [{
          description: "cloudy",
          icon: "04d"
        }]
      }
      offset = -21600

      weather = DailyWeather.new(base, offset)

      expect(weather).to be_a DailyWeather
      expect(weather.date).to be_a String
      expect(weather.sunrise).to be_a String
      expect(weather.sunset).to be_a String
      expect(weather.date).to_not eq(weather.sunrise)
      expect(weather.sunrise).to_not eq(weather.sunset)
      expect(weather.sunset).to_not eq(weather.date)
      expect(weather.max_temp).to be_a Float
      expect(weather.max_temp).to eq(base[:temp][:max])
      expect(weather.min_temp).to be_a Float
      expect(weather.min_temp).to eq(base[:temp][:min])
      expect(weather.max_temp).to_not eq(weather.min_temp)
      expect(weather.conditions).to be_a String
      expect(weather.conditions).to eq(base[:weather][0][:description])
      expect(weather.icon).to be_a String
      expect(weather.icon).to eq(base[:weather][0][:icon])
      expect(weather.conditions).to_not eq(weather.icon)
    end
  end
end
