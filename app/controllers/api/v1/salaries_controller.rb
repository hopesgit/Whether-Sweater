class Api::V1::SalariesController < ApplicationController
  def index
    urban = SalariesFacade.find_salary_information(params[:destination])
    render json: SalariesSerializer.new(urban)
  end
end
