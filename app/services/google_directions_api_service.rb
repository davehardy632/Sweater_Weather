class GoogleDirectionsApiService
  attr_reader :origin, :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def return_trip
    parsed_response(conn.get)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&outputFormat=json&mode=driving") do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['Google_Geocode_API_KEY']
    end
  end

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
