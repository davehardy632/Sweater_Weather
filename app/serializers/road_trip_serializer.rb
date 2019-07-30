class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :temperature,
             :summary,
             :estimated_travel_time


end
