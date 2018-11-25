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
  get "/" => "tweets#index"
  mount API => '/'
  get "/mypage" => "mypages#index"
  get "/get_tweets" => "tweets#get_tweets"
end
