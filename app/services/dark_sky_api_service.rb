class DarkSkyApiService

  def initialize(coordinate_object)
    @coordinate_object = coordinate_object
  end

  def parse_weather_data
    parsed_response(conn.get("/forecast/#{ENV['Dark_Sky_API_KEY']}/#{coordinate_object.latitude},#{coordinate_object.longitude}?exclude=minutely,alerts,flags"))
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
