Rails.application.routes.draw do
  get 'about', to: 'about#show'
  get 'albums', to: 'albums#show'
  get 'albums/submit'
  get 'albums/fetch', to: 'albums#fetch'
  post 'albums/update', to: 'albums#update'
  post 'albums/report'
  post 'albums/destroy'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'users/create', to: 'users#create'

  post 'reports/create'
  post 'reports/destroy'

  get 'users', to: 'users#show'
  get 'users/panel', to: 'users#panel'
  post 'users/destroy'
  post 'users/toggle-admin', to: 'users#toggle_admin'
  post 'users/toggle-ban', to: 'users#toggle_ban'
  
  #Helper tools - MUST BE REMOVED IN PROD!!!
  get 'users/make-admin', to: 'users#make_admin'
  get 'users/nuke-admin', to: 'users#nuke_admin'
  
  resources :albums
  
  root 'albums#show'
end
