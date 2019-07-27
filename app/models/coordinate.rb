class Coordinate
  attr_reader :id,
              :location,
              :latitude,
              :longitude

  def initialize(coordinate_data)
    @id = coordinate_data[:results].first[:place_id]
    @location = "" + coordinate_data[:results].first[:address_components].first[:long_name] + " " + coordinate_data[:results].first[:address_components].third[:long_name]
    @latitude = coordinate_data[:results].first[:geometry][:location][:lat]
    @longitude = coordinate_data[:results].first[:geometry][:location][:lng]
  end


end
