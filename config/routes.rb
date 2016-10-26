Rails.application.routes.draw do
  resources :breweries
  resources :users
  root 'breweries#index'
  get '/new', to: 'breweries#new'
end
