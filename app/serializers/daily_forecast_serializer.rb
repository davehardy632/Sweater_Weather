class DailyForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :time,
              :summary,
              :icon,
              :precipitation_probablility,
              :precipitation_type,
              :temperature_high,
              :temperature_low
end
