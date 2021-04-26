require 'rails_helper'

describe SalariesSerializer, type: :class do
  it 'serializes an object' do
    urban_area = SalariesFacade.find_salary_information("dallas")
    test = SalariesSerializer.new(urban_area).serializable_hash

    expect(test).to be_a Hash
    expect(test).to have_key(:data)
    expect(test[:data][:id]).to eq(nil)
    expect(test[:data][:type]).to eq(:salaries)
    expect(test[:data][:attributes][:destination]).to eq("dallas")
    expect(test[:data][:attributes]).to have_key(:destination)
    expect(test[:data][:attributes]).to have_key(:forecast)
    expect(test[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(test[:data][:attributes][:forecast]).to have_key(:summary)
    expect(test[:data][:attributes]).to have_key(:salaries)
    expect(test[:data][:attributes][:salaries]).to be_an(Array)
    test[:data][:attributes][:salaries].each do |salary|
      expect(salary.title).to be_a String
      expect(salary.min).to be_a String
      expect(salary.max).to be_a String
    end
  end
end
