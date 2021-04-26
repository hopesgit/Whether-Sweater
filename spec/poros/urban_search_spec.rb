require 'rails_helper'

describe UrbanSearch, type: :class do
  before do
    @urban = SalariesFacade.find_salary_information("denver")
  end

  it 'destination' do
    expect(@urban.destination).to eq("denver")
  end

  it 'forecast' do
    expect(@urban.forecast[:summary]).to be_a String
    expect(@urban.forecast[:temperature]).to be_a String
  end

  it 'salaries' do
    salary_list = @urban.salaries
    salary_list.each do |salary|
      expect(salary.title).to be_a String
      expect(salary.min).to be_a String
      expect(salary.max).to be_a String
    end
  end
end
