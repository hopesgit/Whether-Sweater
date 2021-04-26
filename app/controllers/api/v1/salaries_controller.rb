class APi::V1::SalariesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.teleport.org')

    ua_id = conn.get("/api/urban_areas/slug:#{params[:destination]}/")
    binding.pry
  end
end
