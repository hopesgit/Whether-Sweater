require 'rails_helper'

describe MapsService, type: :class do
  describe 'class methods' do
    it 'fetch_weather' do
      VCR.use_cassette('denver_coordinates') do
        location = "denver,co"
        test = MapsService.fetch_coordinates(location)

        expect(test[:info][:statuscode]).to eq(0)
        expect(test[:options][:maxResults]).to eq(1)
        expect(test[:results][0][:providedLocation][:location]).to eq("denver,co")
        expect(test[:results][0][:locations][0]).to have_key(:latLng)
        expect(test[:results][0][:locations][0][:latLng]).to have_key(:lat)
        expect(test[:results][0][:locations][0][:latLng][:lat]).to be_a Float
        expect(test[:results][0][:locations][0][:latLng]).to have_key(:lng)
        expect(test[:results][0][:locations][0][:latLng][:lng]).to be_a Float
        expect(test[:results][0][:locations][1]).to eq(nil)
      end
    end
  end
end
