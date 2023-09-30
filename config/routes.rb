Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root :to => 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'
  resources :items, only: [:index, :show], controller: 'public/items'
  resources :cart_items, only: [:index, :create, :update, :destroy], controller: 'public/cart_items'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'
  resources :customers, only: [:show, :edit, :update], controller: 'public/customers'
  get 'customers/check' => 'public/customers#check', as: 'customer_check'
  patch 'customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'
  resources :orders, only: [:new, :index, :show, :create], controller: 'public/orders'
  post 'orders/check' => 'public/orders#check', as: 'order_check'
  get 'orders/complete' => 'public/orders#complete', as: 'complete'
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root :to => 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show]
  end
  
end
