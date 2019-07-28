class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :serialize_current,
             :serialize_daily,
             :serialize_hourly
end
