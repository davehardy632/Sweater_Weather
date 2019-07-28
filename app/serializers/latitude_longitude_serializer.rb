class LatitudeLongitudeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location,
             :latitude,
             :longitude
end
