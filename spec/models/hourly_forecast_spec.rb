require 'rails_helper'


describe HourlyForecast do
  it "has attributes" do
    hourly_forecast_data = {:time=>1564430400,
 :summary=>"Partly Cloudy",
 :icon=>"partly-cloudy-day",
 :precipIntensity=>0,
 :precipProbability=>0,
 :temperature=>91,
 :apparentTemperature=>91,
 :dewPoint=>43.62,
 :humidity=>0.19,
 :pressure=>1013.71,
 :windSpeed=>6.89,
 :windGust=>14.77,
 :windBearing=>96,
 :cloudCover=>0.27,
 :uvIndex=>9,
 :visibility=>2.579,
 :ozone=>294.2}

  forecast = HourlyForecast.new(hourly_forecast_data)

  expect(forecast.id).to eq("hourly forecast info")
  expect(forecast.time).to eq(1564430400)
  expect(forecast.icon).to eq("partly-cloudy-day")
  expect(forecast.temperature).to eq(91)

  end
end
