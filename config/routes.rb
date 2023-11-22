Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  namespace :administrator do
    resources :sessions, only: [:new, :create, :destroy]
  end

  namespace :customer do
    resources :sessions, only: [:new, :create, :destroy]
  end

  resources :products
end
