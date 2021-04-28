require 'rails_helper'

describe MapsService, type: :class do
  describe 'class methods' do
    it 'fetch_coordinates' do
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

    it 'fetch_directions' do
      VCR.use_cassette('directions_from_phoenix_to_detroit') do
        start_loc = "Phoenix, AZ"
        end_loc = "Detroit, MI"
        test = MapsService.fetch_directions(start_loc, end_loc)

        expect(test).to be_a Hash
        expect(test).to have_key(:locations)
        expect(test).to have_key(:time)
        expect(test[:locations]).to be_an Array
        expect(test[:locations][1]).to be_a Hash
        expect(test[:locations][1]).to have_key :latLng
        expect(test[:locations][1][:latLng]).to be_a Hash
        expect(test[:locations][1][:latLng]).to have_key :lat
        expect(test[:locations][1][:latLng]).to have_key :lng
        expect(test[:locations][1][:latLng][:lat]).to be_a Float
        expect(test[:locations][1][:latLng][:lng]).to be_a Float
        expect(test[:time]).to be_a Integer
      end
    end
  end
end
