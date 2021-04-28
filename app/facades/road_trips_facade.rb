class RoadTripsFacade
  def self.get_road_trip_info(start_loc, end_loc)
    route = MapsService.fetch_directions(start_loc, end_loc)
    coordinates = MapsService.fetch_coordinates(end_loc)[:results][0][:locations][0][:latLng]
    weather = WeatherService.fetch_weather_for_location(coordinates[:lat], coordinates[:lng])
    forecast = Forecast.new(weather, 48)
    RoadTrip.new(start_loc, end_loc, route[:time], forecast.hourly_weather)
  end
end
