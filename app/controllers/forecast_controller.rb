class ForecastController < ApplicationController

  def index
    render json: LatitudeLongitudeSerializer.new(google_geocode_service.return_coordinates(forecast_params["location"]))
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def google_geocode_service
    GoogleGeocodeService.new
  end

end
