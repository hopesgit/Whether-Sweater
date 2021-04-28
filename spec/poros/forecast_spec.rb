require 'rails_helper'

describe Forecast, type: :class do
  before :each do
    VCR.use_cassette('weather_for_denver') do
      lat = 39.738453
      long = -104.984853
      weather = WeatherService.fetch_weather_for_location(lat, long)
      @forecast = Forecast.new(weather)
    end
  end

  it '#current_weather' do
    current = @forecast.current_weather
    expect(current).to be_a CurrentWeather
    expect(current.datetime).to be_a String
    expect(current.sunrise).to be_a String
    expect(current.sunset).to be_a String
    expect(current.temperature).to be_a Float
    expect(current.feels_like).to be_a Float
    expect(current.humidity).to be_a Numeric
    expect(current.uvi).to be_a Numeric
    expect(current.visibility).to be_a Numeric
    expect(current.conditions).to be_a String
    expect(current.icon).to be_a String
  end

  it '#daily_weather' do
    daily = @forecast.daily_weather
    expect(daily.count).to eq(5)
    expect(daily).to be_an Array
    daily.each do |day|
      expect(day).to be_a DailyWeather
      expect(day.date).to be_a String
      expect(day.sunrise).to be_a String
      expect(day.sunset).to be_a String
      expect(day.max_temp).to be_a Float
      expect(day.min_temp).to be_a Float
      expect(day.conditions).to be_a String
      expect(day.icon).to be_a String
    end
  end

  it '#hourly_weather' do
    hourly = @forecast.hourly_weather
    expect(hourly.count).to eq(8)
    expect(hourly).to be_an Array
    hourly.each do |hour|
      expect(hour).to be_a Hash
      expect(hour[:time]).to be_a String
      expect(hour[:temperature]).to be_a Float
      expect(hour[:conditions]).to be_a String
      expect(hour[:icon]).to be_a String
    end
  end
end
