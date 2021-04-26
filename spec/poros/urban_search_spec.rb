require 'rails_helper'

describe UrbanSearch, type: :class do
  before do
    @urban = SalariesFacade.find_salary_information("dallas")
  end

  it 'destination' do
    expect(@urban.destination).to eq("dallas")
  end

  it 'forecast' do

  end
end
