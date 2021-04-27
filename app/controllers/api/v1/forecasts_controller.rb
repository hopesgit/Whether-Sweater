class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = ForecastsFacade.find_weather(params[:location])
    if forecast.class == Forecast
      render json: ForecastSerializer.new(forecast).serialized_json
    else
      render json: {message: "Something went wrong with the request. Please try again."}, status: 204
    end
  end
end
