Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'login' => "user_sessions#new", :as => :login
  get 'log_in' => "user_sessions#new", :as => :log_in
  get 'signin' => "user_sessions#new", :as => :signin
  get 'sign_in' => "user_sessions#new", :as => :sign_in
  get 'logout' => "user_sessions#destroy", :as => :logout
  get 'signup' => 'users#new', :as => :signup
  get 'sign_up' => 'users#new', :as => :sign_up
  get 'register' => 'users#new', :as => :register
  get 'user_sessions/new'
  get 'welcome/index'
  resources :user_sessions
  resources :users
  resources :posts

  root 'welcome#index'
end
