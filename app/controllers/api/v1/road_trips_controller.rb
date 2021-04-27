class Api::V1::RoadTripsController < ApplicationController
  def create
    user = User.find_by(api_key: read_body[:api_key])
    render json: {message: "API Key incorrect, not sent, or sent incorrectly"}, status: 401 if !user
    if read_body[:origin] && read_body[:destination]
      route = MapsService.fetch_directions(read_body[:origin], read_body[:destination])
      coordinates = route[:location][1][:latLng]
      weather = WeatherService.fetch_weather_for_location(coordinates[:lat], coordinates[:lng])
      forecast = Forecast.new(weather)
      trip = RoadTrip.new()
    else
      render json: {message: "Destination or origin information missing, incorrect, or sent improperly."}, status: 400
    end
  end
end
