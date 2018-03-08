Rails.application.routes.draw do
  resources :comments
  resources :uploads
  get '/hovedside', to: 'main#hovedside'

  get '/profil', to: 'main#profil'
  
  get '/login', to: 'main#login'

  post '/login', to: 'main#signin'
  
  get '/notat', to: 'main#notat'

  get '/logout', to: 'main#logout'

  get '/document', to: 'main#document'

  resources :users

  root 'main#profil'


end
