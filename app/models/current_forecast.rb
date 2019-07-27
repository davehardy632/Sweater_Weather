class CurrentForecast
  attr_reader :time,
              :summary,
              :icon,
              :precipitation_probablility,
              :temperature,
              :feels_like_temperature,
              :humidity,
              :uv_index,
              :visibility
              
  def initialize(current_forecast_data)
    @time = current_forecast_data[:time]
    @summary = current_forecast_data[:summary]
    @icon = current_forecast_data[:icon]
    @precipitation_probablility = current_forecast_data[:precipProbablility]
    @temperature = current_forecast_data[:temperature]
    @feels_like_temperature = current_forecast_data[:apparentTemperature]
    @humidity = current_forecast_data[:humidity]
    @uv_index = current_forecast_data[:uvIndex]
    @visibility = current_forecast_data[:visibility]
  end

end
