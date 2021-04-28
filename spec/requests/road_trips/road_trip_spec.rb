require 'rails_helper'

describe 'When a post request is sent to "/api/v1/road_trip"' do
  describe 'with the user_id, starting point, and destination in body' do
    before do
      @user = User.create(email: "hamhamham@ham.ham", password: "hamham")
    end
    it 'it should make a road trip and report the info', :vcr do
      post '/api/v1/road_trip', params: {origin: "Dallas, TX", destination: "Denver, CO", api_key: @user.api_key}, as: :json

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(parsed).to have_key :data
      expect(parsed[:data]).to have_key :id
      expect(parsed[:data]).to have_key :type
      expect(parsed[:data]).to have_key :attributes
      expect(parsed[:data][:id]).to be nil
      expect(parsed[:data][:type]).to be_a String
      expect(parsed[:data][:type]).to eq("roadtrip")
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

    it 'cars dont swim', :vcr do
      post '/api/v1/road_trip', params: {origin: "Seattle, WA", destination: "Honolulu, HI", api_key: @user.api_key}, as: :json

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(parsed).to have_key :data
      expect(parsed[:data]).to have_key :id
      expect(parsed[:data]).to have_key :type
      expect(parsed[:data]).to have_key :attributes
      expect(parsed[:data][:attributes]).to have_key :start_city
      expect(parsed[:data][:attributes][:start_city]).to eq("Seattle, WA")
      expect(parsed[:data][:attributes]).to have_key :end_city
      expect(parsed[:data][:attributes][:end_city]).to eq("Honolulu, HI")
      expect(parsed[:data][:attributes]).to have_key :travel_time
      expect(parsed[:data][:attributes][:travel_time]).to eq("impossible route")
      expect(parsed[:data][:attributes]).to have_key :weather_at_eta
      expect(parsed[:data][:attributes][:weather_at_eta]).to_not have_key :temperature
      expect(parsed[:data][:attributes][:weather_at_eta]).to_not have_key :conditions
    end

    it 'wont create a road trip without a valid api_key' do
      post '/api/v1/road_trip', params: {origin: "Seattle, WA", destination: "Honolulu, HI", api_key: "lkfjhsaeljhfb"}, as: :json

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(401)

      expect(parsed).to have_key(:message)
      expect(parsed[:message]).to eq("API Key incorrect, not sent, or sent incorrectly")
    end

    it 'wont create a road trip with missing or inappropriately-sent routing params' do
      post '/api/v1/road_trip', params: {origin: "Seattle, WA", api_key: @user.api_key}, as: :json

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(parsed).to have_key(:message)
      expect(parsed[:message]).to eq("Destination or origin information missing, incorrect, or sent improperly.")
    end
  end
end
