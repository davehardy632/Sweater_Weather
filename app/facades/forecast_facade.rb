class ForecastFacade

  attr_reader :id

  def initialize(city_state)
    @id = "forecast data"
    @city_state = city_state
  end

  def forecast_data_by_city
    dark_sky_api_service(coordinates_from_city_state).parse_weather_data
  end

  def parse_current
    CurrentForecast.new(forecast_data_by_city)
  end

  def parse_hourly
    forecast_data_by_city[:hourly][:data].take(8).map do |hour|
      HourlyForecast.new(hour)
    end
  end

  def parse_daily
    forecast_data_by_city[:daily][:data].take(5).map do |day|
      DailyForecast.new(day)
    end
  end

  def current_forecast
    CurrentForecastSerializer.new(parse_current)
  end

  def daily_forecast
    DailyForecastSerializer.new(parse_daily)
  end

  def hourly_forecast
    HourlyForecastSerializer.new(parse_hourly)
  end

  private

  attr_reader :city_state

  def google_geocode_service
    GoogleGeocodeService.new
  end

  def coordinates_from_city_state
    google_geocode_service.return_coordinates(city_state)
  end

  def dark_sky_api_service(lat_long_coordinates)
    DarkSkyApiService.new(lat_long_coordinates)
  end
end
