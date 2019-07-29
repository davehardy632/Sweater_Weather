class GoogleDirectionsApiService

  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end
  
  def return_trip
    parsed_response(conn.get)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{finish}&outputFormat=json") do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['Google_Geocode_API_KEY']
    end
  end

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end


end
