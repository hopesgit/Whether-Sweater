require 'rails_helper'

describe 'When a post request is sent to "/api/v1/road_trips"' do
  describe 'with the user_id, starting point, and destination in body' do
    before do
      @user = User.create(email: "hamhamham@ham.ham", password: "hamham")
    end
    it 'it should make a road trip and report the info' do
      post '/api/v1/road_trip', params: {origin: "Dallas, TX", destination: "Denver, CO", api_key: @user.api_key}, as: :json

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(parsed).to have_key :data
      expect(parsed[:data]).to have_key :id
      expect(parsed[:data]).to have_key :type
      expect(parsed[:data]).to have_key :attributes
      expect(parsed[:data][:id]).to be nil
      expect(parsed[:data][:type]).to be_a String
      expect(parsed[:data][:type]).to be("roadtrip")
      expect(parsed[:data][:attributes]).to have_key :start_city
      expect(parsed[:data][:attributes]).to have_key :end_city
      expect(parsed[:data][:attributes]).to have_key :travel_time
      expect(parsed[:data][:attributes]).to have_key :weather_at_eta
      expect(parsed[:data][:attributes][:start_city]).to be_a String
      expect(parsed[:data][:attributes][:end_city]).to be_a String
      expect(parsed[:data][:attributes][:travel_time]).to be_a String
      expect(parsed[:data][:attributes][:weather_at_eta]).to have_key :temperature
      expect(parsed[:data][:attributes][:weather_at_eta]).to have_key :conditions
      expect(parsed[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
      expect(parsed[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
    end
  end
end
