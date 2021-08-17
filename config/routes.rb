Rails.application.routes.draw do
  get '/admin' => 'admin/homes#top'
  namespace :admin do
    
    get '/admins/products' => 'products#index'
    get 'products/new'
    get 'products/create'
    get 'products/show'
    get 'products/edit'
    get 'products/update'
    
    resources :products
  end
  namespace :public do
    get '/deliveries' => 'deliveries#index'
    get 'deliveries/create'
    get 'deliveries/edit'
    get 'deliveries/update'
    get 'deliveries/destroy'
    get '/cart_products' => 'cart_products#index'
    get 'cart_products/update'
    get 'cart_products/create'
    get 'cart_products/destroy'
    get 'cart_products/all_destroy'
    get 'users/my_page' => 'users#show'
    get 'users/edit'
    get 'users/update'
    get 'users/unsubscribe'
    get 'users/unsubscribe_update'
    get '/shops' => 'shops#index'
    get 'shops/show'
    get '/products' => 'products#index'
    get 'products/show'
    resources :users
    resources :products
    resources :deliveries 
  end
  root to: 'homes#top'
  
  
  
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
