Rails.application.routes.draw do
  
  def constraint(req)
    return req.path.scan(/\/rails\/active_storage.+/).empty?
  end
  
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
  get 'users/resend-email', to: 'users#resend_confirmation_email'
  get 'users/:username', to: 'users#show', as: 'user', constraints: { :username => /[^\/]+/ }
  post 'users/destroy'
  post 'users/create'
  post 'users/update'
  post 'users/toggle-admin', to: 'users#toggle_admin'
  post 'users/toggle-ban', to: 'users#toggle_ban'
  get 'users/:id/confirm-email', to: 'users#confirm_email'
  
  #Helper tools - MUST BE REMOVED IN PROD!!!
  get 'tools/make-admin', to: 'users#make_admin'
  get 'tools/nuke-admin', to: 'users#nuke_admin'
  
  get 'forum', to: 'forum#show'
  get 'forum/:category', to: 'forum#show_board', as: 'category'
  get 'forum/*category/t/:thread_id', to: 'forum_threads#show', as: 'thread', constraints: lambda { |request| constraint(request) }
  
  get 'thread/:category/new', to: 'forum_threads#new', as: 'board'
  post 'thread/destroy', to: 'forum_threads#destroy'
  post 'thread/create', to: 'forum_threads#create'
  
  post 'posts/create'
  post 'posts/update'
  post 'posts/destroy'

  post 'upvotes/create'
  
  get 'articles', to: 'articles#show'
  get 'articles/:article_id', to: 'articles#show_article', as: 'article', constraints: lambda { |request| constraint(request) }
  
  post 'comments/create'
  post 'comments/destroy'
  
  get 'home', to: 'home#show'
  
  resources :albums
  
  get '*unmatched_route', to: 'application#render_404', constraints: lambda { |request| constraint(request) }
  root 'home#show'
end
