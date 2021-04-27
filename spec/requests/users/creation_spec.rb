require 'rails_helper'

describe 'When I send a post request to "/api/v1/users"' do
  describe 'with user params in the json-formatted body' do
    it 'should send back a response with user details if valid' do
      post '/api/v1/users', params: {email: "borkbork@dog.com", password: "bones", password_confirmation: "bones"}, as: :json

      expect(response).to have_http_status(200)

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

    # sad path

    it 'should send an error if info is sent as params' do
      post '/api/v1/users?email=borkbork@bork.com&password=bones&password_confirmation=bones'

      expect(response).to have_http_status(400)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:message)
      expect(parsed.keys.count).to eq(1)
      expect(parsed[:message]).to eq("Error: Not all fields filled out or information sent incorrectly.")
    end
  end
end
