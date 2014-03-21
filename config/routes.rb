Pricemeter::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products
  resources :users
  resources :supermarkets, only: [:index]
  resources :lists
  resources :listitems, except: :destroy do
    collection do
      get "calculate"
      delete "destroy", as: 'destroy' 
    end
  end

  resources :suggestions do
    member do
       get "serve"
     end
  end
	
end
