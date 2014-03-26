Pricemeter::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'homepage#home'
  resources :products
  resources :users
  resources :supermarkets, only: [:show] do
    member do
      get 'discount'
    end
  end
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

  # resources :pricemeasures, only: [:index] do
  #   collection do
  #     post 'import'
  #   end
  # end
  # 
  
  resources :pricemeasure_imports

end
