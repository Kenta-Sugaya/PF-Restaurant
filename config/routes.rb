Rails.application.routes.draw do
  namespace :public do
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
    resources :products
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
