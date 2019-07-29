class TripRestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :end_city,
             :restaurants

end
