Rails.application.routes.draw do

   root to: 'pages#main'

  resources :users
  resources :sessions, only: [:create]
  delete "logout" => "sessions#destroy"

  get '/main', to: 'pages#main', as: 'main'

end
