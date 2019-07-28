class ForecastController < ApplicationController

  # def index
  #   weather_service = DarkSkyApiService.new(google_geocode_service.return_coordinates(forecast_params["location"]))
  #   render json: ForecastSerializer.new(weather_service)
  # end

  def index
    render json: ForecastSerializer.new(forecast_facade.forecast_data_by_city(forecast_params["location"]))
  end


  private

  def forecast_params
    params.permit(:location)
  end

  def forecast_facade
    ForecastFacade.new
  end

  # def google_geocode_service
  #   GoogleGeocodeService.new
  # end

  # def dark_sky_api_service
  #   DarkSkyApiService.new
  # end

end
