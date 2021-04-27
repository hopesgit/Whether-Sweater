require 'rails_helper'

describe ForecastsFacade, type: :class do
  describe 'class methods' do
    it '.find_weather', :vcr do
      test = ForecastsFacade.find_weather("seattle,wa")

      expect(test).to_not be_a(Hash)
      expect(test).to be_a(Forecast)
      expect(test.current_weather).to be_a(Hash)
      expect(test.daily_weather).to be_an(Array)
      expect(test.hourly_weather).to be_an(Array)
    end

    # sad path?
    xit 'sends an error if the maps api doesnt return anything' do
      allow(MapsService).to receive(:fetch_coordinates).and_return({error: "blahblahblah"})
      test = ForecastsFacade.find_weather("seattle,wa")

      expect(test).to eq("blahblahblah")
    end

    # redo this
    xit 'finds data even with a garbage search', :vcr do
      test = ForecastsFacade.find_weather("dfslkjhg3w7io5yt938w7yv5o837wqv5rvt gb3wqo8745rnvy ")

      expect(test).to_not be_a(Hash)
      expect(test).to be_a(Forecast)
      expect(test.current_weather).to be_a(Hash)
      expect(test.daily_weather).to be_an(Array)
      expect(test.hourly_weather).to be_an(Array)
    end
  end
end
