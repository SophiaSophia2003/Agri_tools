Rails.application.routes.draw do
  devise_for :administrators
  ActiveAdmin.routes(self)

  # devise_for :administrators, controllers: { sessions: 'administrators/sessions', registrations: 'administrators/registrations' }
  devise_for :customers

  namespace :administrators do
    root "aministrators/products#index"
    resources :products
    resources :categories
    resources :customers
    resources :provinces
    resources :taxes
    resources :orders do
      member do
        get 'edit_status'
        patch 'update_status'
      end
    end
  end
  resources :administrators
  resources :categories


  namespace :customer do
    resource :products, only: [:index]
  end
# devise_for :administrators
# devise_for :customers, controllers: {
#   registrations: 'customers/registrations'
# }

  # Defines the root path route ("/")
  root "homes#index"
  resource :customer, only: [:show, :edit, :update]
  resources :customers, path: "customers".to_s.humanize.parameterize do
    resources :addresses
  end
  resources :orders, only: [:index, :show, :new, :create]
  resources :products
  resource :cart, only: [:show]
  resources :carts do
    member do
      patch 'update_quantity'
      delete 'destroy'
    end
  end
  resources :cart_items, only: [:create, :update, :destroy]
   post 'cart/add_to_cart/:product_id', to: 'cart#add_to_cart', as: 'add_to_cart'

   resource :checkout, only: [:show] do
      post 'process_payment', on: :member
   end
end
