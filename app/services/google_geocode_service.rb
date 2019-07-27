class GoogleGeocodeService

  def return_coordinates(city_state)
    Coordinate.new(parsed_response(conn.get("?address=#{city_state}")))
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['Google_Geocode_API_KEY']
    end
  end

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end


end
