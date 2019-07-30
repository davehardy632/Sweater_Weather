class ArrivalForecast
  attr_reader :temperature,
  :summary

  def initialize(forecast_data)
    @temperature = forecast_data[:currently][:temperature]
    @summary = forecast_data[:currently][:summary]
  end


end
