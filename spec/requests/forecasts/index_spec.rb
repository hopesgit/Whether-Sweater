require 'rails_helper'

describe "When I send a get request to '/api/v1/forecast'" do
  describe 'with location params' do
    it 'returns weather data', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to have_http_status(:success)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data][:id]).to eq(nil)
      expect(parsed[:data][:type]).to eq("forecast")
      expect(parsed[:data][:attributes]).to have_key(:current_weather)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(parsed[:data][:attributes][:current_weather]).to have_key(:icon)

      expect(parsed[:data][:attributes]).to have_key(:daily_weather)
      parsed[:data][:attributes][:daily_weather].each do |day|
        expect(day).to have_key(:date)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:max_temp)
        expect(day).to have_key(:min_temp)
        expect(day).to have_key(:conditions)
        expect(day).to have_key(:icon)
      end
      
      expect(parsed[:data][:attributes]).to have_key(:hourly_weather)
      parsed[:data][:attributes][:hourly_weather].each do |hour|
        expect(hour).to have_key(:time)
        expect(hour).to have_key(:temperature)
        expect(hour).to have_key(:conditions)
        expect(hour).to have_key(:icon)
      end
    end
  end
end
