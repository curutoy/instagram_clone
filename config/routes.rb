Rails.application.routes.draw do
  root 'microposts#index'
  
  devise_for :users, :controllers => { :registrations => 'users/registrations',
                                            :sessions => 'users/sessions',     
                                           :passwords => "users/passwords",
                                  :omniauth_callbacks => "users/omniauth_callbacks" } 
                                  
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end
  
  resources :microposts
  resources :relationships,  only: [:create, :destroy]
  resources :favorites,      only: [:create, :destroy]
  resources :microposts do
    resources :comments , only: [:create , :destroy ]
  end
  resources :notifications, only: :index
                                          
  devise_scope :user do
    get "signup", :to   => "users/registrations#new"
    get "login", :to    => "users/sessions#new"
    get "logout", :to   => "users/sessions#destroy"
  end

end