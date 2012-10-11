Ogapg::Application.routes.draw do

  root :to => 'home#index'
  resources :products
  devise_for :admins
end
