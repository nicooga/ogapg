Ogapg::Application.routes.draw do

  root :to => 'home#index'

  resources :products
  
  namespace :admin do 
    resources :products
    resources :admins
  end
  
  #resources :admins
end
