class Api::V1::UsersController < ApplicationController

  def create
    if User.find_by(email: user_params["email"])
      payload = {
        error: "Use A Different Email",
        status: 400
      }
        render :json => payload, :status => :bad_request
    else
      token = "S_W" + SecureRandom.urlsafe_base64
      user = User.create(email: user_params["email"], password: user_params[:password], password_confirmation: user_params["password_confirmation"], api_key: token)
      render json: {
                    "api_key": user.api_key,
                  }, status: :created
    end
  end

  private

  def user_params
    params.permit("email", "password", "password_confirmation")
  end

end
