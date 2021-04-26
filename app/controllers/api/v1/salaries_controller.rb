class Api::V1::SalariesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.teleport.org')
    ua_id = "slug:#{params[:destination]}"

    response = conn.get("/api/urban_areas/#{ua_id}/salaries")
    salaries_search = JSON.parse(response.body, symbolize_names: true)

    coordinates = MapsService.fetch_coordinates(params[:destination])
    lat = coordinates[:results][0][:locations][0][:latLng][:lat]
    long = coordinates[:results][0][:locations][0][:latLng][:lng]

    weather = WeatherService.fetch_weather_for_location(lat, long)

    forecast = Forecast.new(weather)

    urban = UrbanSearch.new(salaries_search[:salaries], forecast, params[:destination])

    binding.pry
  end
end
