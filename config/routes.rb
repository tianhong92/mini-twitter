Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'login' => "user_sessions#new", :as => :login
  get 'log_in' => "user_sessions#new", :as => :log_in
  get 'signin' => "user_sessions#new", :as => :signin
  get 'sign_in' => "user_sessions#new", :as => :sign_in
  get 'logout' => "user_sessions#destroy", :as => :logout
  get 'account' => 'users#show', :as => :account
  get 'my_account' => 'users#show', :as => :my_account
  get 'signup' => 'users#new', :as => :signup
  get 'sign_up' => 'users#new', :as => :sign_up
  get 'register' => 'users#new', :as => :register
  get 'user_sessions/new'
  get 'welcome/index'
  resources :user_sessions
  resources :users
  resources :posts
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  #root 'layouts#application'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
