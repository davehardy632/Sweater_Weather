class DarkSkyApiService

  def initialize(latitude, longitude, time = Time.now.to_i )
    @latitude = latitude
    @longitude = longitude
    @time = time
  end

  def parse_weather_data
    if updated_forecast
      updated_forecast
    else
      forecast_data = parsed_response(conn.get("/forecast/#{ENV['Dark_Sky_API_KEY']}/#{latitude},#{longitude}?exclude=minutely,alerts,flags"))
      forecast = Forecast.create(latitude: latitude, longitude: longitude, data: forecast_data)
      JSON.parse(forecast.data.to_json, symbolize_names: true)
    end
  end

  def updated_forecast
    forecast = Forecast.find_by(latitude: latitude, longitude: longitude)
    if forecast && (forecast.updated_at.to_i) > (Time.now.to_i - 1800)
      forecast.data
    else
      false
    end
  end

  def fetch_latest_forecast
    forecast = Forecast.find_by(latitude: latitude, longitude: longitude)
    if forecast
      forecast.data
    else
      Forecast.create(latitude: latitude, longitude: longitude, data: forecast)
    end
  end

  def parse_weather_data_upon_arrival
    parsed_response(conn.get("/forecast/#{ENV['Dark_Sky_API_KEY']}/#{latitude},#{longitude},#{Time.now.to_i + time}?exclude=hourly,daily"))
  end

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  attr_reader :latitude, :longitude, :time

  def conn
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
