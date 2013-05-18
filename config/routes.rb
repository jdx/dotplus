Dotplus::Application.routes.draw do
  resources :users

  get 'auth/twitter/callback' => 'sessions#create'
  get 'auth/failure' => 'sessions#failure'
  get 'logout' => 'sessions#destroy'

  root to: 'pages#home', constraints: { subdomain: /www|^$/ }
  root to: 'events#index', constraints: { subdomain: /.+/ }, as: :event
end
