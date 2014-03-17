Pricemeter::Application.routes.draw do

  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products
  resources :users
  resources :supermarkets, only: [:index]
  resources :suggestions
 
	
end
