class RoadTripFacade
  attr_reader :id, :temperature, :summary, :estimated_travel_time

  def initialize(origin, destination)
    @id = "Road trip information"
    @origin = origin
    @destination = destination
  end

  def travel_time
    Trip.new(trip_information)
  end

  def estimated_travel_time
    travel_time.trip_duration
  end

  def trip_information
    google_directions_api_service.return_trip
  end


  def weather_data_by_destination
    dark_sky_api_service.parse_weather_data_upon_arrival
  end

  def forecast_at_arrival
    ArrivalForecast.new(weather_data_by_destination)
  end

  def summary
    forecast_at_arrival.summary
  end

  def temperature
    forecast_at_arrival.temperature
  end

  private
  attr_reader :origin, :destination
  def google_directions_api_service
    GoogleDirectionsApiService.new(origin, destination)
  end

  def dark_sky_api_service
    DarkSkyApiService.new(travel_time.destination_latitude, travel_time.destination_longitude, travel_time.trip_length_in_seconds)
  end

end
