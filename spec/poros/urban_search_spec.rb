require 'rails_helper'

describe UrbanSearch, type: :class do
  before do
    VCR.use_cassette('weather_for_denver') do
      weather = WeatherService.fetch_weather_for_location("denver,co")
      forecast = Forecast.new(weather)
      job_search = File.read('./spec/fixtures/chicago_salary_search.json')
      parsed_salaries = JSON.parse(job_search, symbolize_names: true)
      @urban = UrbanSearch.new(parsed_salaries, forecast, "denver")
    end
  end

  it 'destination' do
    expect(@urban.destination).to eq("denver")
  end

  it 'forecast' do

  end
end
