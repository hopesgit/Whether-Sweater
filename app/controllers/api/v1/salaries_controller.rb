class Api::V1::SalariesController < ApplicationController
  def index
    location = params[:destination]
    urban = SalariesFacade.find_salary_information(location)
    render json: SalariesSerializer.new(urban)
  end
end
