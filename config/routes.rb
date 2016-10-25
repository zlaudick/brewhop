Rails.application.routes.draw do
  resources :breweries
  resources :users
  root 'breweries#index'
end
