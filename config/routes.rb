Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'simple_pages/service'
  resources :gearproducts
  resources :products
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#index'

  resources :orders, only: [:index, :show, :create, :new, :destroy]
end
