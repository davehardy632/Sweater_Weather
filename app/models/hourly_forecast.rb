class HourlyForecast
  attr_reader :time,
              :icon,
              :temperature

  def initialize(hourly_forecast_data)
    @time = hourly_forecast_data[:time]
    @icon = hourly_forecast_data[:icon]
    @temperature = hourly_forecast_data[:temperature]
  end

end
