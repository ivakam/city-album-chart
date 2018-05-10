Rails.application.routes.draw do
  get 'about/index'
  get 'albums/index'

  resources :albums
  
  root 'albums#index'
end
