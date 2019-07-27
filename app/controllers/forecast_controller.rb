class ForecastController < ApplicationController

  def index
    render json: LatitudeLongitudeSerializer.new(dark_sky_api_service.render_weather_data(google_geocode_service.return_coordinates(forecast_params["location"])))
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def google_geocode_service
    GoogleGeocodeService.new
  end

  def dark_sky_api_service
    DarkSkyApiService.new
  end

end
