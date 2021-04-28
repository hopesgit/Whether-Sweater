class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: read_body[:email])
    if user && user.authenticate(read_body[:password])
      render json: UsersSerializer.new(user).serialized_json
    else
      render json: {message: "Credentials invalid or sent as params."}, status: 400
    end
  end
end
