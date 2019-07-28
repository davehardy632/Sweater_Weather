class HourlyForecast
  attr_reader :id,
              :time,
              :icon,
              :temperature

  def initialize(hourly_forecast_data)
    @id = "hourly forecast info"
    @time = hourly_forecast_data[:time]
    @icon = hourly_forecast_data[:icon]
    @temperature = hourly_forecast_data[:temperature]
  end

end
