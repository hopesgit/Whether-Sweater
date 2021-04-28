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
      expect(test[:data][:id]).to eq(nil)
      expect(test[:data]).to have_key(:type)
      expect(test[:data][:type]).to eq(:roadtrip)
      expect(test[:data]).to have_key(:attributes)
      expect(test[:data][:attributes]).to have_key(:start_city)
      expect(test[:data][:attributes][:start_city]).to eq("Dallas, TX")
      expect(test[:data][:attributes]).to have_key(:end_city)
      expect(test[:data][:attributes][:end_city]).to eq("Austin, TX")
      expect(test[:data][:attributes]).to have_key(:travel_time)
      expect(test[:data][:attributes][:travel_time]).to eq("0 hours, 5 minutes")
      expect(test[:data][:attributes]).to have_key(:weather_at_eta)
      expect(test[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(test[:data][:attributes][:weather_at_eta][:conditions]).to eq(hourly.conditions)
      expect(test[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(test[:data][:attributes][:weather_at_eta][:temperature]).to eq(hourly.temperature)
    end
  end
end
