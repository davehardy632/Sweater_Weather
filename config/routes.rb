Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/forecast', to: "forecast#index"
  get '/api/v1/backgrounds', to: "background#show"
  post '/api/v1/users', to: "users#create"
  post '/api/v1/sessions', to: "sessions#create"
  post '/api/v1/road_trip', to: "road_trip#index"
end
