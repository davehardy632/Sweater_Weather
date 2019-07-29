class TripRestaurantFacade


  attr_reader :start, :finish, :food_type, :id
  def initialize(trip_data)
    @start = trip_data["start"]
    @finish = trip_data["end"]
    @food_type = trip_data["food"]
  end


  def end_city
    trip_data = google_directions_api_service.return_trip
    Trip.new(trip_data)
  end

  def restaurants
    cuisines_open = yelp_api_service.return_cuisines_and_hours
  end

  def google_directions_api_service
    GoogleDirectionsApiService.new(start, finish)
  end

  def yelp_api_service
    YelpApiService.new(food_type, finish, end_city)
  end

end
