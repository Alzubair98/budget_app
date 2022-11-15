Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :groups
  resources :entities
  # Defines the root path route ("/")
  # root "articles#index"
end
