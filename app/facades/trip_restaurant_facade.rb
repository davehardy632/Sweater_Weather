class TripRestaurantFacade


  attr_reader :start, :finish, :food, :id
  def initialize(trip_data)
    @start = trip_data["start"]
    @finish = trip_data["end"]
    @food_type = trip_data["food"]
  end


  def end_city
    trip_data = google_directions_api_service.return_trip
    binding.pry
  end

  def google_directions_api_service
    GoogleDirectionsApiService.new(start, finish)
  end

end
