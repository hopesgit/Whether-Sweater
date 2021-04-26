class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = ForecastsFacade.find_weather(params[:location])
    render json: ForecastSerializer.new(forecast).serialized_json
  end
end
