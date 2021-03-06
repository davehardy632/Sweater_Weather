class Api::V1::ForecastController < ApplicationController

  def index
    render json: ForecastSerializer.new(forecast_facade)
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def forecast_facade
    ForecastFacade.new(forecast_params["location"])
  end
end
