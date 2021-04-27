class Api::V1::RoadTripsController < ApplicationController
  def create
    user = User.find_by(api_key: read_body[:api_key])
    render json: {message: "API Key incorrect, not sent, or sent incorrectly"}, status: 401 if !user
    # MapsService
    # binding.pry
  end
end
