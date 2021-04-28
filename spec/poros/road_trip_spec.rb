require 'rails_helper'

describe RoadTrip do
  describe 'class methods' do
    it 'initialize', :vcr do
      start_loc = "Denver, CO"
      end_loc = "Kansas City, KS"
      route = MapsService.fetch_directions(start_loc, end_loc)
      # binding.pry
      coordinates = route[:locations][1][:latLng]
      weather = WeatherService.fetch_weather_for_location(coordinates[:lat], coordinates[:lng])
      forecast = Forecast.new(weather, 48)
      trip = RoadTrip.new(start_loc, end_loc, route[:time], forecast.hourly_weather)

      expect(trip).to be_a RoadTrip
      expect(trip.start_city).to eq(start_loc)
      expect(trip.start_city).to be_a(String)
      expect(trip.end_city).to eq(end_loc)
      expect(trip.end_city).to be_a(String)
      expect(trip.travel_time).to be_a(String)
      expect(trip.weather_at_eta).to be_a(Hash)
      expect(trip.weather_at_eta[:temperature]).to be_a(Float)
      expect(trip.weather_at_eta[:conditions]).to be_a(String)
    end
  end
end
