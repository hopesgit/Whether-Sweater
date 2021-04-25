require 'rails_helper'

describe WeatherService, type: :class do
  describe 'class methods' do
    it 'fetch_weather' do
      VCR.use_cassette('weather_for_denver') do
        lat = 39.738453
        long = -104.984853
        test = WeatherService.fetch_weather_for_location(lat, long)

        expect(test[:lat]).to eq(lat.round(4))
        expect(test[:lat]).to be_a(Numeric)
        expect(test[:lon]).to eq(long.round(4))
        expect(test[:lon]).to be_a(Numeric)
        expect(test[:timezone]).to eq("America/Denver")
        expect(test[:timezone_offset]).to eq(-21600)
        expect(test[:current]).to be_a(Hash)
        expect(test[:current][:dt]).to be_a(Numeric)
        expect(test[:current][:sunrise]).to be_a(Numeric)
        expect(test[:current][:sunset]).to be_a(Numeric)
        expect(test[:current][:temp]).to be_a(Numeric)
        expect(test[:current][:feels_like]).to be_a(Numeric)
        expect(test[:current][:humidity]).to be_a(Numeric)
        expect(test[:current][:uvi]).to be_a(Numeric)
        expect(test[:current][:visibility]).to be_a(Numeric)
        expect(test[:current][:weather][0][:description]).to be_a(String)
        expect(test[:current][:weather][0][:icon]).to be_a(String)
        expect(test[:hourly].count).to be >= 8
        expect(test[:hourly]).to be_an(Array)
        expect(test[:hourly][0]).to be_a(Hash)
        expect(test[:hourly][0][:dt]).to be_a(Numeric)
        expect(test[:hourly][0][:temp]).to be_a(Numeric)
        expect(test[:hourly][0][:weather][0][:description]).to be_a(String)
        expect(test[:hourly][0][:weather][0][:icon]).to be_a(String)
        expect(test[:daily].count).to be >= 5
        expect(test[:daily]).to be_an(Array)
        expect(test[:daily][0]).to be_a(Hash)
        expect(test[:daily][0][:dt]).to be_a(Numeric)
        expect(test[:daily][0][:sunrise]).to be_a(Numeric)
        expect(test[:daily][0][:sunset]).to be_a(Numeric)
        expect(test[:daily][0][:temp][:max]).to be_a(Numeric)
        expect(test[:daily][0][:temp][:min]).to be_a(Numeric)
        expect(test[:daily][0][:weather][0][:description]).to be_a(String)
        expect(test[:daily][0][:weather][0][:icon]).to be_a(String)
      end
    end
  end
end
