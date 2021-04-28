class Api::V1::UsersController < ApplicationController
  def create
    create_params = read_body
    user = User.new(create_params)
    if user.save
      render json: UsersSerializer.new(user).serialized_json
    else
      render json: {message: "Error: Not all fields filled out or information sent incorrectly."}, status: 400
    end
  end
end
