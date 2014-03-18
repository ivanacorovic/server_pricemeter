Pricemeter::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products
  resources :users
  resources :supermarkets, only: [:index]
  resources :lists
  resources :carts

  resources :suggestions do
    member do
       get "serve"
     end
  end
	
end
