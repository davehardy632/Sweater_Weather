require 'rails_helper'

describe "User can register with the application" do
  it "user enters credentials and recieves an api key" do

    post '/api/v1/users', :params => {
                              "email": "whatever@example.com",
                              "password": "password",
                              "password_confirmation": "password"
                            }

  expect(response).to be_successful
  api_response = JSON.parse(response.body)
  expect(api_response.keys.first).to eq("api_key")
  expect(response.status).to eq(201)
  expect(User.last.email).to eq("whatever@example.com")
  end
end
