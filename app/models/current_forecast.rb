class CurrentForecast
  attr_reader :id,
              :timezone,
              :time,
              :summary,
              :icon,
              :precipitation_probablility,
              :temperature,
              :feels_like_temperature,
              :humidity,
              :uv_index,
              :visibility

  def initialize(current_forecast_data)
    @id = "current forecast info"
    @timezone = current_forecast_data[:timezone]
    @time = current_forecast_data[:currently][:time]
    @summary = current_forecast_data[:currently][:summary]
    @icon = current_forecast_data[:currently][:icon]
    @precipitation_probablility = current_forecast_data[:currently][:precipProbablility]
    @temperature = current_forecast_data[:currently][:temperature]
    @feels_like_temperature = current_forecast_data[:currently][:apparentTemperature]
    @humidity = current_forecast_data[:currently][:humidity]
    @uv_index = current_forecast_data[:currently][:uvIndex]
    @visibility = current_forecast_data[:currently][:visibility]
  end

end
