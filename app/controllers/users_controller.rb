class UsersController < ApplicationController

  def create
    token = "S_W" + SecureRandom.urlsafe_base64
    user = User.create(email: user_params["email"], password: user_params[:password], password_confirmation: user_params["password_confirmation"], api_key: token)
    render json: {
                  "api_key": user.api_key,
                }, status: :created
  end

  private

  def user_params
    params.permit("email", "password", "password_confirmation")
  end

end
