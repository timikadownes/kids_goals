Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do 
  #user actions
  
  get "/users/:id" => "users#show"
  post "/login" => "users#create"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"
  post "/users" => "users#create"

  #kid actions
  get "/kids" => "kids#index"
  get "/kids/:id" => "kids#show"
  post "/kids" => "kids#create"
  patch "/kids/:id" => "kids#update"
  delete "kids/:id" => "kids#destroy"

  #goal actions
  get "/goals" => "goals#index"
  get "/goals/:id" => "goals#show"
  post "/goals" => "goals#create"
  patch "/goals/:id" => "goals#update"
  delete "goals/:id" => "goals#destroy"
  
  end
  

end
