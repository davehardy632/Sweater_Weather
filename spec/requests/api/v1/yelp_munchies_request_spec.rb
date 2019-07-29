require 'rails_helper'

describe "time length between locations and find matching cuisines" do
  it "makes an api call to yelp and google directions api" do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    trip_data = JSON.parse(response.body)


    expect(trip_data.count).to eq(3)
  end
end

# Munchies
#
# GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese Content-Type: application/json Accept: application/json
#
# You will use the Google Directions API: https://developers.google.com/maps/documentation/directions/start in order to find out how long it will take to travel from the two locations, and then using the Yelp API, you will find all of the restaurants matching the cuisine, the example here is Chinese, that WILL BE OPEN at your estimated time of arrival.
#
# Your API will return the end city, and three restaurants, along with their name and address.
#
# Technical notes:
#
# The Yelp API only accepts time as UNIX time. You can conert a Time object into UNIX time by doing something like this: Time.now.to_i
#
# You can find out time in the future using a feature built into Rails' ActiveSupport which will let you do things like this: Time.now + 4.hours (This will ONLY work in Rails and not a pry session run from the command line)
