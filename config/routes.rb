Rails.application.routes.draw do
  get 'about', to: 'about#show'
  get 'albums', to: 'albums#show'
  get 'albums/submit'
  get 'albums/fetch', to: 'albums#fetch'
  
  resources :albums
  
  root 'albums#show'
end
