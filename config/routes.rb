Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "user_signups" }
  get 'simple_pages/service'
  resources :gearproducts
  resources :products do
    resources :comments
  end
  resources :users
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  post 'payments/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#index'

  resources :orders, only: [:index, :show, :create, :new, :destroy]

end
