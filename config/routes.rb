Ogapg::Application.routes.draw do

  root :to => 'home#index'
  resources :products
  resources :prices, :properties, :only => [:destroy]
  devise_for :admins
end
