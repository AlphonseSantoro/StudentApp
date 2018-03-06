Rails.application.routes.draw do
  resources :uploads
  get 'main/hovedside'

  get '/profil', to: 'main#profil'
  
  get '/login', to: 'main#login'

  post '/main/login', to: 'main#signin'
  
  get '/logout', to: 'main#logout'

  resources :users

  root 'main#profil'


end
