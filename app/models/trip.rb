class Trip
  attr_reader :trip_duration, :trip_length_in_seconds, :destination_latitude, :destination_longitude

  def initialize(trip_information)
    @trip_duration = trip_information[:routes].first[:legs].first[:duration][:text]
    @trip_length_in_seconds = trip_information[:routes].first[:legs].first[:duration][:value]
    @destination_latitude = trip_information[:routes].first[:legs].first[:end_location][:lat]
    @destination_longitude = trip_information[:routes].first[:legs].first[:end_location][:lng]
  end

end
