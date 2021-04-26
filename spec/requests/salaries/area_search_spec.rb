require 'rails_helper'

describe 'When I send a get request to "/api/v1/salaries"' do
  describe 'with a destination parameter' do
    it 'I get salary information for that area' do
      get '/api/v1/salaries?destination=chicago'

      expect(response).to have_http_status(:success)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to eq(nil)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq("salaries")
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:destination)
      expect(parsed[:data][:attributes][:destination]).to eq("chicago")
      expect(parsed[:data][:attributes]).to have_key(:forecast)
      expect(parsed[:data][:attributes][:forecast]).to have_key(:summary)
      expect(parsed[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(parsed[:data][:attributes]).to have_key(:temperature)
      expect(parsed[:data][:attributes][:temperature]).to be_a String
      expect(parsed[:data][:attributes]).to have_key(:salaries)
      expect(parsed[:data][:attributes][:salaries]).to be_an(Array)
      expect(parsed[:data][:attributes][:salaries][0]).to be_a(Hash)
      expect(parsed[:data][:attributes][:salaries][0]).to have_key(:title)
      expect(parsed[:data][:attributes][:salaries][0][:title]).to be_a String
      expect(parsed[:data][:attributes][:salaries][0]).to have_key(:min)
      expect(parsed[:data][:attributes][:salaries][0][:min]).to be_a String
      expect(parsed[:data][:attributes][:salaries][0]).to have_key(:max)
      expect(parsed[:data][:attributes][:salaries][0][:max]).to be_a String
    end
  end
end
