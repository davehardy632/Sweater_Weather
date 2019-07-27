class ForecastController < ApplicationController

  def index
    weather_service = DarkSkyApiService.new(google_geocode_service.return_coordinates(forecast_params["location"]))
    render json: ForecastSerializer.new(weather_service.render_weather_data)
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def google_geocode_service
    GoogleGeocodeService.new
  end

  # def dark_sky_api_service
  #   DarkSkyApiService.new
  # end

end
