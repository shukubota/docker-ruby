Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users" => "users#index"
  get "/users/show/:id" => "users#show"
  post "/users/edit/:id" => "users#edit"
  post "/users/delete/:id" => "users#delete"
  get "/users/register" => "users#register"
  post "/users/create" => "users#create"
  post "/users/save/:id" => "users#save"
  get "/tweets/show/:id" => "tweets#show"
  post "/tweets/edit/:id" => "tweets#edit"
  post "/tweets/delete/:id" => "tweets#delete"
  get "/tweets/register" => "tweets#register"
  post "/tweets/create" => "tweets#create"
  post "/tweets/save/:id" => "tweets#save"
  get "/tweets" => "tweets#index"
  get "/" => "items#index"
  mount API => '/'
  get "/mypage" => "mypages#index"
  get "/get_tweets" => "tweets#get_tweets"
  get "/users/sign_in" => "users#sign_in_index"
  get "/companies/sign_in" => "companies#sign_in_index"
  post "/companies/companies_sign_in" => "companies#sign_in"

  get "/items" => "items#index"
  get "/items/show/:id" => "items#show"
  post "/items/edit/:id" => "items#edit"
  post "/items/delete/:id" => "items#delete"
  get "/items/register" => "items#register"
  post "/items/create" => "items#create"
  post "/items/save/:id" => "items#save"
end
