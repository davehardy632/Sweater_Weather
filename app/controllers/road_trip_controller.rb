class RoadTripController < ApplicationController

  def index
    user = User.where(api_key: road_trip_params["api_key"]).first
    if user
      render json: RoadTripSerializer.new(road_trip_facade)
    else
      payload = {
        error: "Incorrect Api Key",
        status: 401
      }
        render :json => payload, :status => :unauthorized
    end
  end

  private

  def road_trip_params
    params.permit("origin", "destination", "api_key")
  end

  def road_trip_facade
    RoadTripFacade.new(road_trip_params["origin"], road_trip_params["destination"])
  end
end
