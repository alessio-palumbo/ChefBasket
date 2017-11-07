Rails.application.routes.draw do
  get 'order_products/new'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/', to: 'users/sessions#new'
  end
  
  resources :food_businesses
  get 'food_businesses/:id/home' => 'food_businesses#home', as: 'food_business_home'
  resources :suppliers
  get 'home' => 'suppliers#home'

  resources :orders
  resources :products
  resources :order_products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
