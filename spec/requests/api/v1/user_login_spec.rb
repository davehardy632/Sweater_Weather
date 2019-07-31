require 'rails_helper'

describe "User Login" do
  it "User can login with email and password and recieve the token used when they registered" do

    User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4" )

    post '/api/v1/sessions', :params => {
                                "email": "whatever@example.com",
                                "password": "password"
                              }

    expect(response).to be_successful

    api_response = JSON.parse(response.body)

    expect(api_response.keys.first).to eq("api_key")
    expect(api_response.values.first).to eq("jgn983hy48thw9begh98h4539h4")
    expect(response.status).to eq(200)
  end

  it "User cannot login with bad credentials" do

    User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4" )

    post '/api/v1/sessions', :params => {
                                "email": "whatever@gmail.com",
                                "password": "password"
                              }

      error_message = JSON.parse(response.body)
      expect(error_message).to eq({"error"=>"Incorrect Credentials", "status"=>400})
      expect(response.status).to eq(400)
  end
end
