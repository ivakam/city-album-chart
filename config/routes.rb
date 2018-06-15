Rails.application.routes.draw do
  get 'about/index'
  get 'albums/index'
  get 'albums/submit'

  resources :albums
  
  root 'albums#index'
end
