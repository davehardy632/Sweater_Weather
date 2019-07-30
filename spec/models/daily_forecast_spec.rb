require 'rails_helper'


describe DailyForecast do
  it "has attributes" do
    daily_forecast_data = {:time=>1564380000,
 :summary=>"Foggy in the afternoon.",
 :icon=>"fog",
 :sunriseTime=>1564401453,
 :sunsetTime=>1564453066,
 :moonPhase=>0.92,
 :precipIntensity=>0.0009,
 :precipIntensityMax=>0.0058,
 :precipIntensityMaxTime=>1564434000,
 :precipProbability=>0.09,
 :precipType=>"rain",
 :temperatureHigh=>91.53,
 :temperatureHighTime=>1564430400,
 :temperatureLow=>65.39,
 :temperatureLowTime=>1564488000,
 :apparentTemperatureHigh=>91.53,
 :apparentTemperatureHighTime=>1564430400,
 :apparentTemperatureLow=>65.39,
 :apparentTemperatureLowTime=>1564488000,
 :dewPoint=>48.32,
 :humidity=>0.36,
 :pressure=>1013.54,
 :windSpeed=>5.84,
 :windGust=>19.71,
 :windGustTime=>1564444800,
 :windBearing=>170,
 :cloudCover=>0.1,
 :uvIndex=>9,
 :uvIndexTime=>1564426800,
 :visibility=>5.79,
 :ozone=>293.4,
 :temperatureMin=>64.65,
 :temperatureMinTime=>1564401600,
 :temperatureMax=>91.53,
 :temperatureMaxTime=>1564430400,
 :apparentTemperatureMin=>64.65,
 :apparentTemperatureMinTime=>1564401600,
 :apparentTemperatureMax=>91.53,
 :apparentTemperatureMaxTime=>1564430400}

  forecast = DailyForecast.new(daily_forecast_data)

  expect(forecast.id).to eq("daily forecast info")
  expect(forecast.time).to eq(1564380000)
  expect(forecast.summary).to eq("Foggy in the afternoon.")
  expect(forecast.icon).to eq("fog")
  expect(forecast.precipitation_probablility).to eq(0.09)
  expect(forecast.precipitation_type).to eq("rain")
  expect(forecast.temperature_high).to eq(91.53)
  expect(forecast.temperature_low).to eq(65.39)
  end
end
