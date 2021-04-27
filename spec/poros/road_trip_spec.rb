require 'rails_helper'

describe RoadTrip do
  describe 'class methods' do
    xit 'initialize' do
      allow_any_instance_of(Forecast).to receive(:current_weather).and_return({})
      allow_any_instance_of(Forecast).to receive(:daily_weather).and_return([])
      allow_any_instance_of(Forecast).to receive(:hourly_weather).and_return([])
      # weather = Forecast.new()
    end
  end
end
