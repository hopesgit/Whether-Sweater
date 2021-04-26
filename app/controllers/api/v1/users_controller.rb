class Api::V1::UsersController < ApplicationController
  def create
    create_params = read_body
    user = User.create(create_params)
    render json: UsersSerializer.new(user).serialized_json
  end

  private

  def read_body
    JSON.parse(request.body.read, symbolize_headers: true)
  end
end
