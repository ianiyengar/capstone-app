Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  get "/users" => "users#index"
  post "/sessions" => "sessions#create"
  post "/top_tens" => "top_tens#create"
  get "/users/topten:id" => "topten#show"
  get "/albums" => "albums#index"
  post "spotify_authorize" => "albums#spotify_authorize"
end
