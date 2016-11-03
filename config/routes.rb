Rails.application.routes.draw do
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :breweries
  resources :users
  root 'breweries#index'
  get '/new', to: 'breweries#new'
end
