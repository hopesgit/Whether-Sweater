class ApplicationController < ActionController::API
  def read_body
    body = request.body.read
    if body == ""
      Hash.new
    else
      JSON.parse(body, symbolize_names: true)
    end
  end
end
