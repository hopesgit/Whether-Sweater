require 'rails_helper'

describe RoadTripsFacade do
  it 'get_road_trip_info', :vcr do
    test = RoadTripsFacade.get_road_trip_info("Detroit, MI", "Houston, TX")
    expect(test).to be_a(RoadTrip)
    expect(test.start_city).to eq("Detroit, MI")
    expect(test.end_city).to eq("Houston, TX")
    expect(test.travel_time).to eq("19 hours, 30 minutes")
    expect(test.weather_at_eta[:temperature]).to be_a Numeric
    expect(test.weather_at_eta[:conditions]).to be_a String
  end
end
