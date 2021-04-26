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
  end
end
