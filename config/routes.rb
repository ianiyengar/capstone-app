Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  get "/users" => "users#index"
  post "/sessions" => "sessions#create"
  post "/top_tens" => "top_tens#create"
  get "/users/topten:id" => "topten#show"
  get "/albums" => "albums#index"
  get "/random_album" => "albums#random"
  post "spotify_authorize" => "albums#spotify_authorize"
  get "/spotify_user_info" => "albums#spotify_user_info"
  get "/spotify_search" => "albums#spotify_search"
end
