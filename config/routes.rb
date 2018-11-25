Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users" => "users#index"
  get "/users/show/:id" => "users#show"
  post "/users/edit/:id" => "users#edit"
  post "/users/delete/:id" => "users#delete"
  get "/users/register" => "users#register"
  post "/users/create" => "users#create"
  post "/users/save/:id" => "users#save"
  get "/" => "users#index"
  mount API => '/'
end
