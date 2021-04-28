require 'rails_helper'

describe 'when I send a get request to "/api/v1/backgrounds"' do
  describe 'with the location params included' do
    it 'steals an image from bing as we should' do
      get '/api/v1/backgrounds?location="denver,co"'
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq("image")
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to eq(nil)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:name)
      expect(parsed[:data][:attributes][:name]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:image_url)
      expect(parsed[:data][:attributes][:image_url]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:creative_commons_license)
      expect(parsed[:data][:attributes][:creative_commons_license]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:microsoft_privacy_statement)
      expect(parsed[:data][:attributes][:microsoft_privacy_statement]).to be_a(String)
    end
  end
end
