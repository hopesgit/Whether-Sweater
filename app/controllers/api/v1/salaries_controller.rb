class Api::V1::SalariesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.teleport.org')
    ua_id = "slug:#{params[:destination]}"

    response = conn.get("/api/urban_areas/#{ua_id}/salaries")
    response_parsed = JSON.parse(response.body, symbolize_names: true)

    UrbanSearch.new(response_parsed[:salaries])
    binding.pry
  end
end
