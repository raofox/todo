Rails.application.routes.draw do

  root :to => 'sessions#new'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :todo_lists do
    resources :todo_items, only: [:create, :edit, :update, :destroy]
  end
end
