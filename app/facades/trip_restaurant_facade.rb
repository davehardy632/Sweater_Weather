class TripRestaurantFacade


  attr_reader :start, :finish, :food_type, :id, :end_city, :restaurants
  def initialize(trip_data)
    @id = "restaurants open at arrival"
    @start = trip_data["start"]
    @finish = trip_data["end"]
    @food_type = trip_data["food"]
  end


  def trip_object
    trip_data = google_directions_api_service.return_trip
    trip = Trip.new(trip_data)
  end

  def end_city
    trip_object.end_city
  end

  def restaurants
    cuisines_open = yelp_api_service.return_cuisines_and_hours
    cuisines_open[:businesses].take(3).map do |restaurant|
      Restaurant.new(restaurant)
    end
  end

  def google_directions_api_service
    GoogleDirectionsApiService.new(start, finish)
  end

  def yelp_api_service
    YelpApiService.new(food_type, finish, trip_object)
  end

end
