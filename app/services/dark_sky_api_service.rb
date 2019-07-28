class DarkSkyApiService

  attr_reader :id

  def initialize(coordinate_object)
    @coordinate_object = coordinate_object
    @id = "forecast response"
  end

  def parse_weather_data
    parsed_response(conn.get("/forecast/#{ENV['Dark_Sky_API_KEY']}/#{coordinate_object.latitude},#{coordinate_object.longitude}?exclude=minutely,alerts,flags"))
  end

  def parse_current
    CurrentForecast.new(parse_weather_data)
  end

  def parse_hourly
    parse_weather_data[:hourly][:data].take(8).map do |hour|
      HourlyForecast.new(hour)
    end
  end

  def parse_daily
    parse_weather_data[:daily][:data].take(5).map do |day|
      DailyForecast.new(day)
    end
  end

  def serialize_daily
    DailyForecastSerializer.new(parse_daily)
  end

  def serialize_hourly
    HourlyForecastSerializer.new(parse_hourly)
  end

  def serialize_current
    CurrentForecastSerializer.new(parse_current)
  end

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  attr_reader :coordinate_object

  def conn
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
