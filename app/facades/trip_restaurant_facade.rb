class TripRestaurantFacade


  attr_reader :start, :end, :food
  def initialize(trip_data)
    @start = trip_data["start"]
    @end = trip_data["end"]
    @food_type = trip_data["food"]
  end


  def end_city
    GoogleDirectionsApiService.new(start, end)
  end
end
