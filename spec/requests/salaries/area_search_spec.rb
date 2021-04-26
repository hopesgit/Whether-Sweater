require 'rails_helper'

describe 'When I send a get request to "/api/v1/salaries"' do
  describe 'with a destination parameter' do
    it 'I get salary information for that area' do
      get '/api/v1/salaries?destination=chicago'

      expect(response).to have_http_status(:success)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data]).to have_key(:attributes)
    end
  end
end
