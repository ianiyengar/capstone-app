Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  post "/top_tens" => "top_tens#create"
  get "/users/topten" => "users#index"
  get "/users/topten:id" => "topten#show"
end
