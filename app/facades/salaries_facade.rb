class SalariesFacade
  def self.find_salary_information(area)
    conn = Faraday.new(url: 'https://api.teleport.org')
    ua_id = "slug:#{area}"

    response = conn.get("/api/urban_areas/#{ua_id}/salaries")
    salaries_search = JSON.parse(response.body, symbolize_names: true)

    coordinates = MapsService.fetch_coordinates(area)
    lat = coordinates[:results][0][:locations][0][:latLng][:lat]
    long = coordinates[:results][0][:locations][0][:latLng][:lng]

    weather = WeatherService.fetch_weather_for_location(lat, long)

    forecast = Forecast.new(weather)
    binding.pry

    UrbanSearch.new(salaries_search[:salaries], forecast, area)
  end
end
