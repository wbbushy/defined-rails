Rails.application.routes.draw do

  root to: 'pages#main'

  resources :users
  resources :words
  resources :sessions, only: [:create]

  get '/main', to: 'pages#main', as: 'main'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  delete "logout" => "sessions#destroy"



end
