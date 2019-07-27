class CurrentForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :time,
              :summary,
              :icon,
              :precipitation_probablility,
              :temperature,
              :feels_like_temperature,
              :humidity,
              :uv_index,
              :visibility
end
