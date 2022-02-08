Rails.application.routes.draw do
  devise_for :users
  resources :transacs
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "categories#index"
end
