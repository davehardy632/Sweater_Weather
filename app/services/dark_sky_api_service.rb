class DarkSkyApiService

  def initialize(latitude, longitude, time = Time.now.to_i )
    @latitude = latitude
    @longitude = longitude
    @time = time
  end

  def parse_weather_data
    parsed_response(conn.get("/forecast/#{ENV['Dark_Sky_API_KEY']}/#{latitude},#{longitude}?exclude=minutely,alerts,flags"))
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
