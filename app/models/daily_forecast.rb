class DailyForecast

  attr_reader :id,
              :time,
              :summary,
              :icon,
              :precipitation_probablility,
              :precipitation_type,
              :temperature_high,
              :temperature_low

  def initialize(daily_forecast_data)
    binding.pry
    @id = "daily forecast info"
    @time = daily_forecast_data[:time]
    @summary = daily_forecast_data[:summary]
    @icon = daily_forecast_data[:icon]
    @precipitation_probablility = daily_forecast_data[:precipProbability]
    @precipitation_type = daily_forecast_data[:precipType]
    @temperature_high = daily_forecast_data[:temperatureHigh]
    @temperature_low = daily_forecast_data[:temperatureLow]
  end
end
