class SessionsController < ApplicationController

  def create
    user = User.where(email: session_params["email"]).first

    if user && user.authenticate(session_params["password"])
      render json: {
        "api_key": user.api_key,
      }, status: :ok
    else
      payload = {
        error: "Incorrect Credentials",
        status: 400
      }
        render :json => payload, :status => :bad_request
    end
  end

  private

  def session_params
    params.permit("email", "password")
  end
end
