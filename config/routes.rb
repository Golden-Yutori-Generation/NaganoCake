Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  devise_for :members,skip: [:passwords,], controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }

  get 'members/mypage' => 'members#show'
  get 'members/out' => 'members#out'
  patch 'members/destroy' => 'members#destroy'
  resources :members, only: [:edit, :update]

  scope :member do
    root to: 'items#top'
    get 'about' => 'items#about', as: 'about'
  end

  namespace :member do
    resources :items, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
