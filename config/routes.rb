Rails.application.routes.draw do
devise_for :customers, controllers: {
  registrations: 'customers/registrations'
}
    # devise_for :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  # namespace :administrator do
  #   resources :sessions, only: [:new, :create, :destroy]
  # end

  # namespace :customer do
  #   resources :sessions, only: [:new, :create, :destroy]
  # end
  resource :customer, only: [:show, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create]
  resources :products
  resource :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
end
