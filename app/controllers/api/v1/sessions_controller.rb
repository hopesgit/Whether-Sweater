class Api::V1::SessionsController < ApplicationController
  def create
    user_params = read_body
    user = User.find_by(email: user_params[:email])
    user.authenticate(user_params[:password])
    render json: UsersSerializer.new(user).serialized_json
  end

  private

  def read_body
    body = request.body.read
    if body == ""
      Hash.new
    else
      JSON.parse(body, symbolize_names: true)
    end
  end
end
