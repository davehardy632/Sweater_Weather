class SessionsController < ApplicationController

  def create
    user = User.where(email: session_params["email"]).first

    if user && user.authenticate(session_params["password"])
      render json: {
        "api_key": user.api_key,
      }, status: :ok
    else
      render status: :unauthorized
    end
  end


  private

  def session_params
    params.permit("email", "password")
  end
end
