require 'rails_helper'

describe MapsService, type: :class do
  describe 'class methods' do
    it 'fetch_weather' do
      location = "denver,co"
      test = MapsService.fetch_weather(location)

      expect(test[:info][:statuscode]).to eq(0)
      expect(test[:options][:maxResults]).to eq(1)
      expect(test[:results][:providedLocation]).to eq("denver,co")
      expect(test[:results][:locations][0]).to have_key(:latLng)
      expect(test[:results][:locations][0][:latLng]).to have_key(:lat)
      expect(test[:results][:locations][0][:latLng][:lat]).to be_a Float
      expect(test[:results][:locations][0][:latLng]).to have_key(:lng)
      expect(test[:results][:locations][0][:latLng][:lng]).to be_a Float
      expect(test[:results][:locations][1]).to eq(nil)
    end
  end
end
