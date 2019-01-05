Rails.application.routes.draw do
  resources :albums
  
  get 'about', to: 'about#show'
  get 'albums', to: 'albums#show'
  get 'albums/submit'
  get 'albums/fetch', to: 'albums#fetch'
  post 'albums/update', to: 'albums#update'
  post 'albums/create'
  post 'albums/destroy'
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'reports/create'
  post 'reports/destroy'

  get 'panel', to: 'users#panel'
  get 'users/:username', to: 'users#show', as: 'user'
  post 'users/destroy'
  post 'users/create'
  post 'users/update'
  post 'users/toggle-admin', to: 'users#toggle_admin'
  post 'users/toggle-ban', to: 'users#toggle_ban'
  
  #Helper tools - MUST BE REMOVED IN PROD!!!
  get 'tools/make-admin', to: 'users#make_admin'
  get 'tools/nuke-admin', to: 'users#nuke_admin'
  
  get 'forum', to: 'forum#show'
  get 'forum/:category', to: 'forum#show_board', as: 'category'
  get '*t/:thread_id', to: 'forum_threads#show', as: 'thread'
  #get 'forum/:category/new', to: 'threads#new', as: 'board'
  
  post 'posts/new'
  
  get 'articles', to: 'articles#show'
  
  def constraint(req)
    p 'Path: ' + req.path
    return req.path.scan(/\/rails\/active_storage.+/).empty?
  end
  
  get '*unmatched_route', to: 'application#render_404', constraints: lambda { |request| constraint(request) }
  root 'albums#show'
end
