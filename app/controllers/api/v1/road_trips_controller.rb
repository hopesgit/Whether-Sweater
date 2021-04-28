class Api::V1::RoadTripsController < ApplicationController
  def create
    user = User.find_by(api_key: read_body[:api_key])
    if !user
      render json: {message: "API Key incorrect, not sent, or sent incorrectly"}, status: 401
    elsif read_body[:origin] && read_body[:destination]
      trip = RoadTripsFacade.get_road_trip_info(read_body[:origin], read_body[:destination])
      render json: RoadtripSerializer.new(trip).serialized_json
    else
      render json: {message: "Destination or origin information missing, incorrect, or sent improperly."}, status: 400
    end
  end
end
