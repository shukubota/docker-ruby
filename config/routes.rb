Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users/edit/:id" => "users#edit"
  post "/users/delete/:id" => "users#delete"
  post "/users/create/:id" => "users#create"
end
