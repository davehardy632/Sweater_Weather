class RoadTripController < ApplicationController

  def index
    if User.find_by(api_key: road_trip_params["api_key"])
      render json: RoadTripSerializer.new(road_trip_facade)
    else
      render json: {
        status: :unauthorized
        }
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
