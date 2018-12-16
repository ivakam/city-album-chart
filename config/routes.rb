Rails.application.routes.draw do
  get 'about', to: 'about#show'
  get 'albums', to: 'albums#show'
  get 'albums/submit'
  get 'albums/fetch', to: 'albums#fetch'
  post 'albums/update', to: 'albums#update'
  post 'albums/report'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'create-account', to: 'users#new'
  post 'create-account', to: 'users#create'

  post 'reports/create'

  get 'panel', to: 'users#show'
  
  resources :albums
  
  root 'albums#show'
end
