class ForecastsFacade
  def self.find_weather(location)
    location_search = MapsService.fetch_coordinates(location)
    lat = location_search[:results][0][:locations][0][:latLng][:lat]
    long = location_search[:results][0][:locations][0][:latLng][:lng]
    weather = WeatherService.fetch_weather_for_location(lat, long)
    Forecast.new(weather)
  end
end
