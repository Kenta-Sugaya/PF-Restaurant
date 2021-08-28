Rails.application.routes.draw do
  root to: 'homes#top'
  get '/admin' => 'admin/homes#top'
  post 'shops' => 'shops#create'
  post 'product' => 'products#new'
  namespace :admin do
    resources :shops do
      resources :products, except: [:index]
    end
    resources :products, only: [:index]
    resources :users
    resources :orders
  end
  namespace :public do
    resources :shops
    resources :users
    get '/my_page' => 'users#show'
    patch '/my_page' => 'users#update'
    get '/unsubscribe' => 'users#unsubscribe'
    resources :products do
      resources :favorites, only: [:create, :destroy]
    end
    resources :deliveries
    resources :cart_products
    get '/cart_products' => 'cart_products#index'
    resources :orders
    post '/orders/confirm' => 'orders#confirm'
    post '/orders/complete' => 'orders#complete'
    resources :contacts
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    post 'done', to: 'contacts#done', as: 'done'
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  devise_for :admins, :controllers => {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
end
