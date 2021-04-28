require 'rails_helper'

describe RoadtripSerializer do
  describe 'class methods' do
    it 'initialize' do
      weather = {
        dt: 354684651,
        temp: 75.4,
        weather: [{
          description: "cloudy with a chance of meatballs",
          icon: "whatever"
          }]
      }

      offset = -21600
      hourly = HourlyWeather.new(weather, offset)
      trip = RoadTrip.new("Dallas, TX", "Austin, TX", 300, [hourly])
      test = RoadtripSerializer.new(trip).serializable_hash

      expect(test).to have_key(:data)
      expect(test[:data]).to have_key(:id)
      expect(test[:data]).to have_key(:type)
      expect(test[:data]).to have_key(:attributes)
      expect(test[:data][:attributes]).to have_key(:start_city)
      expect(test[:data][:attributes]).to have_key(:end_city)
      expect(test[:data][:attributes]).to have_key(:travel_time)
      expect(test[:data][:attributes]).to have_key(:weather_at_eta)
      expect(test[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(test[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    end
  end
end
