Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root :to => 'public/homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
  resources :customers, only: [:show, :edit, :update]
  get 'customers/check' => 'customers#check', as: 'customer_check'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  resources :orders, only: [:new, :index, :show, :create]
  post 'orders/check' => 'orders#check', as: 'order_check'
  get 'orders/complete' => 'orders#complete', as: 'complete'
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root :to => 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
end
