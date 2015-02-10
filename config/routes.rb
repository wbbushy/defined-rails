Rails.application.routes.draw do

   root to: 'pages#main'

  resources :users

end
