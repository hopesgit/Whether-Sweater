require 'rails_helper'

describe 'As a registered user' do
  describe 'when I send a POST request to "/api/v1/sessions"' do
    describe 'with a JSON body containing the users login info' do
      before do
        @email = "barkbarkdog@dog.com"
        @password = "more butts"
        @user = User.create(email: @email, password: @password)
      end

      it 'should create a session for that user and return their info' do
        post '/api/v1/sessions', params: {email: @email, password: @password}, as: :json

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(:success)
        expect(parsed).to have_key(:data)
        expect(parsed[:data]).to have_key(:type)
        expect(parsed[:data][:type]).to eq("users")
        expect(parsed[:data]).to have_key(:id)
        expect(parsed[:data][:id]).to eq(@user.id.to_s)
        expect(parsed[:data]).to have_key(:attributes)
        expect(parsed[:data][:attributes]).to have_key(:email)
        expect(parsed[:data][:attributes][:email]).to eq(@user.email)
        expect(parsed[:data][:attributes]).to have_key(:api_key)
        expect(parsed[:data][:attributes][:api_key]).to eq(@user.api_key)
        expect(parsed[:data][:attributes]).to_not have_key(:password)
        expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
        expect(parsed[:data][:attributes]).to_not have_key(:password_digest)
        expect(parsed[:data][:attributes]).to_not have_key(:exposed_password)
        expect(parsed[:data][:attributes]).to_not have_key(:serious_data_risk)
      end

      it 'should give me an error with incorrect information' do
        post '/api/v1/sessions', params: {email: @email, password: "oops"}, as: :json
        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(405)
        expect(parsed).to have_key(:message)
        expect(parsed[:message]).to eq("Credentials invalid or sent as params.")
      end
    end
  end
end
