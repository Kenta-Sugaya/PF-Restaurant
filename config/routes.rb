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
    resources :orders
    
  end
  namespace :public do
    resources :shops
    resources :users
      get '/my_page' => 'users#show'
      get '/unsubscribe' => 'users#unsubscribe'
    resources :products do
      resources :favorites, only: [:create, :destroy]
    end
    resources :deliveries 
    resources :cart_products
      get '/cart_products' => 'cart_products#index'
      delete '/delete_all' => 'cart_items#delete_all'
    resources :orders
      post '/orders/confirm' => 'orders#confirm'
      get '/orders/complete' => 'orders#complete'
    resources :contacts
      post 'confirm' => 'contacts#confirm', as: 'confirm'
      post 'back' => 'contacts#back', as: 'back'
      get 'done' => 'contacts#done', as: 'done'
  
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
