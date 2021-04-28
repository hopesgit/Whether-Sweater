require 'rails_helper'

describe CurrentWeather do
  describe 'class methods' do
    it 'initialize' do
      base = {
        dt: Faker::Number.number(digits: 10),
        sunrise: Faker::Number.number(digits: 10),
        sunset: Faker::Number.number(digits: 10),
        temp: Faker::Number.decimal(l_digits: 2, r_digits: 1),
        feels_like: Faker::Number.decimal(l_digits: 2, r_digits: 1),
        humidity: Faker::Number.number(digits: 2),
        uvi: Faker::Number.between(from: 0.01, to: 5.00),
        visibility: Faker::Number.number(digits: 5),
        weather: [{
          description: "cloudy",
          icon: "04d"
        }]
      }
      offset = -21600

      weather = CurrentWeather.new(base, offset)

      expect(weather).to be_a CurrentWeather
      expect(weather.datetime).to be_a String
      expect(weather.sunrise).to be_a String
      expect(weather.sunset).to be_a String
      expect(weather.datetime).to_not eq(weather.sunrise)
      expect(weather.datetime).to_not eq(weather.sunset)
      expect(weather.sunrise).to_not eq(weather.sunset)
      expect(weather.datetime).to_not eq(Time.at(base[:dt]).to_s)
      expect(weather.sunrise).to_not eq(Time.at(base[:sunrise]).to_s)
      expect(weather.sunset).to_not eq(Time.at(base[:sunset]).to_s)
      expect(weather.temperature).to be_a(Float)
      expect(weather.feels_like).to be_a(Float)
      expect(weather.humidity).to be_a(Numeric)
      expect(weather.uvi).to be_a(Numeric)
      expect(weather.visibility).to be_a(Numeric)
      expect(weather.conditions).to be_a(String)
      expect(weather.conditions).to eq("cloudy")
      expect(weather.icon).to be_a(String)
      expect(weather.icon).to eq("04d")
    end
  end
end
