class Trip

  attr_reader :duration, :duration_in_seconds, :end_city
  def initialize(trip_data)
    @duration = trip_data[:routes].first[:legs].first[:duration][:text]
    @duration_in_seconds = trip_data[:routes].first[:legs].first[:duration][:value]
    @end_city = trip_data[:routes].first[:legs].first[:end_address]
  end

end
