Rails.application.routes.draw do
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :breweries do
    member do
      get :followers
    end
  end
  resources :users do
    member do
      get :following
    end
  end
  resources :microposts,  only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  root 'breweries#index'
  get '/new', to: 'breweries#new'
  post '/new', to: 'breweries#create'
end
