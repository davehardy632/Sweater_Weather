class Trip

  attr_reader :duration
  def initialize(trip_data)
    @duration = trip_data[:routes].first[:legs].first[:duration][:text]
  end

end
