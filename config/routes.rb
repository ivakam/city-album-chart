Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  get 'about', to: 'about#show'
  get 'albums', to: 'albums#show'
  get 'albums/submit'
  get 'albums/fetch', to: 'albums#fetch'
  post 'albums/update', to: 'albums#update'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'panel', to: 'users#show'
  
  resources :albums
  
  root 'albums#show'
end
