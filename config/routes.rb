Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/forecast', to: "forecast#index"
  get '/api/v1/backgrounds', to: "background#show"
  get '/api/v1/munchies', to: "trip_restaurants#index"
end
