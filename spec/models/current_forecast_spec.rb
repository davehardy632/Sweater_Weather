require 'rails_helper'

describe CurrentForecast do
  it "is instantiated with JSON data and creates an object" do

    current_forecast_data = {:latitude=>39.7392358,
 :longitude=>-104.990251,
 :timezone=>"America/Denver",
 :currently=>
  {:time=>1564410594,
   :summary=>"Clear",
   :icon=>"clear-day",
   :nearestStormDistance=>9,
   :nearestStormBearing=>259,
   :precipIntensity=>0,
   :precipProbability=>0,
   :temperature=>72.26,
   :apparentTemperature=>72.26,
   :dewPoint=>47.57,
   :humidity=>0.41,
   :pressure=>1016.57,
   :windSpeed=>1.61,
   :windGust=>6.06,
   :windBearing=>30,
   :cloudCover=>0.03,
   :uvIndex=>2,
   :visibility=>8.159,
   :ozone=>292.5}}

      forecast = CurrentForecast.new(current_forecast_data)
      
      expect(forecast.id).to eq("current forecast info")
      expect(forecast.timezone).to eq("America/Denver")
      expect(forecast.time).to eq(1564410594)
      expect(forecast.summary).to eq("Clear")
      expect(forecast.icon).to eq("clear-day")
      expect(forecast.precipitation_probablility).to eq(nil)
      expect(forecast.temperature).to eq(72.26)
      expect(forecast.feels_like_temperature).to eq(72.26)
      expect(forecast.humidity).to eq(0.41)
      expect(forecast.uv_index).to eq(2)
      expect(forecast.visibility).to eq(8.159)
  end
end
