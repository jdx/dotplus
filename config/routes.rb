Dotplus::Application.routes.draw do

  root to: 'pages#home', constraints: { subdomain: /www|^$/ }
  root to: 'events#index', constraints: { subdomain: /.+/ }, as: :next_event

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :sponsors
    resources :users
    resources :locations
  end

  get 'auth/twitter/callback' => 'sessions#create'
  get 'auth/failure' => 'sessions#failure'
  get 'logout' => 'sessions#destroy'

  resources :events do
    resources :attendees
  end
  resources :users, path: '/'
end
