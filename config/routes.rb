Rails.application.routes.draw do
  resources :uploads
  get 'main/hovedside'

  get '/profil', to: 'main#profil'
  
  get '/login', to: 'main#login'

  post '/login', to: 'main#signin'
  
  get '/notat', to: 'main#notat'

  get '/logout', to: 'main#logout'

  resources :users

  root 'main#profil'


end
