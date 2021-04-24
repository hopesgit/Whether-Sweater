class Api::V1::ForecastsController < ApplicationController
  def show
    location_search = MapsService.fetch_coordinates(params[:location])
    lat = location_search[:results][0][:locations][0][:latLng][:lat]
    long = location_search[:results][0][:locations][0][:latLng][:lng]
    weather = WeatherService.fetch_weather_for_location(lat, long)
    forecast = Forecast.new(weather)
    render json: ForecastSerializer.new(forecast).serialized_json
  end
end
