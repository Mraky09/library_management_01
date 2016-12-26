Rails.application.routes.draw do

  resources :books
  resources :categories
  root "static_pages#home"
  namespace :admin do
    resources :categories
    resources :authors
    resources :publishers
    resources :books
  end
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
end
