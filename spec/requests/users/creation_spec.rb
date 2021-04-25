require 'rails_helper'

describe 'When I send a post request to "/api/v1/users"' do
  describe 'with user params in the json-formatted body' do
    it 'should send back a response with user details if valid' do
      post '/api/v1/users', params: {}, body: {email: "borkbork@dog.com", password: "bones", password_confirmation: "bones"}.to_json, as: :json

      expect(response).to have_http_status(201)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:type]).to eq("users")
      expect(parsed[:data][:id]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:email)
      expect(parsed[:data][:attributes]).to have_key(:api_key)
      expect(parsed[:data][:attributes]).to_not have_key(:password)
      expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
      expect(parsed[:data][:attributes]).to_not have_key(:password_digest)
      expect(parsed[:data][:attributes][:email]).to eq("borkbork@dog.com")
      expect(parsed[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end
