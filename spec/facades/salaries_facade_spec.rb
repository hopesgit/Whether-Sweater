require 'rails_helper'

describe SalariesFacade, type: :class do
  describe 'find_salary_information' do
    test = SalariesFacade.find_salary_information(location)

    expect(test).to be_a(UrbanSearch)
  end
end
