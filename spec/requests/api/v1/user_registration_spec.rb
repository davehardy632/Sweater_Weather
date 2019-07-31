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

  it "user cannot create an account with an email that has been taken" do
    user = User.create(email: "whatever@gmail.com", password: "password", password_confirmation: "password", api_key: "a98hfwo8ho345htpyfg9dqo39")

    post '/api/v1/users', :params => {
                              "email": "whatever@gmail.com",
                              "password": "password",
                              "password_confirmation": "password"
                            }

    error_message = JSON.parse(response.body)
    expect(error_message).to eq({"error"=>"Use A Different Email", "status"=>400})
    expect(response.status).to eq(400)
  end
end
