Rails.application.routes.draw do
  root to: 'homes#top'
  get '/admin' => 'admin/homes#top'
  patch 'user/:id' => 'users#update'
  post 'shops' => 'shops#create'
  post 'product' => 'products#new'
  namespace :admin do
    resources :shops do
      resources :products, except: [:index]
    end
    resources :products, only: [:index]
    resources :users, only: [:index, :show, :edit, :update ]
      get '/users' => 'users#index'
      get '/edit' => 'users#edit'
  end
  namespace :public do
    resources :shops
    get '/shops' => 'shops#index'
    resources :users
      get '/my_page' => 'users#show'
      get '/unsubscribe' => 'users#unsubscribe'
    resources :products
      get '/products' => 'products#index'
    resources :deliveries 
      get '/deliveries' => 'deliveries#index'
    resources :cart_products
      get '/cart_products' => 'cart_products#index'
  end

  
  
  devise_for :users, :controllers => {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
} 
 
 

  devise_for :admins, :controllers => {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'  
} 

end
