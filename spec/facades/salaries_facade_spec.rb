require 'rails_helper'

describe SalariesFacade, type: :class do
  it 'find_salary_information' do
    test = SalariesFacade.find_salary_information("chicago")

    expect(test).to be_a(UrbanSearch)
  end
end
