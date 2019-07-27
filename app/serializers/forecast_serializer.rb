class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :serialize_daily,
             :serialize_hourly,
             :serialize_current
end
