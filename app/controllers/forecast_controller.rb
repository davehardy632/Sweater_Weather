class ForecastController < ApplicationController

  def index
    weather_service = DarkSkyApiService.new(google_geocode_service.return_coordinates(forecast_params["location"]))
    render json: ForecastSerializer.new(weather_service)
  end

  # forecast_facade.return_forecast_data(forecast_params["location"])

  private

  def forecast_params
    params.permit(:location)
  end

  def forecast_facade
    ForecastFacade.new
  end

  def google_geocode_service
    GoogleGeocodeService.new
  end

  # def dark_sky_api_service
  #   DarkSkyApiService.new
  # end

end
