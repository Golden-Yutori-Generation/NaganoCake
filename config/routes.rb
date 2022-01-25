Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :members,skip: [:passwords,], controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }
  
  namespace :member do
    get 'delivery_addresses/index'
    get 'delivery_addresses/edit'
    get 'searches' => 'searches#search'
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :members, only: [:index, :show, :edit, :update]
    get 'admin/searches' => 'searches#search'
    get 'orders/top'
    get 'orders/show'
  end

  get 'members/mypage' => 'members#show'
  get 'members/out' => 'members#out'
  patch 'members/destroy' => 'members#destroy'
  resources :members, only: [:edit, :update]

  scope module: :member do
    root to: 'items#top'
    get 'about' => 'items#about', as: 'about'
      resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    resources :cart_items, only: [:index, :create, :destroy, :update]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end