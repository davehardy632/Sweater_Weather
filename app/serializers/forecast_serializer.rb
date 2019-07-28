class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :current_forecast,
             :daily_forecast,
             :hourly_forecast

end
