Rails.application.routes.draw do

  resources :profiles
  resources :addresses
  resources :states
  resources :state_ids
  resources :licenses
  resources :passports
  get 'static/home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do 
    resources :states
  end

   resources :users do 
    resources :passports
  end

  # make a users profile 
  get 'users/:id/new' => 'users#new'

  # update a user with a new State of residence
  post 'users/:id/states/:id/edit' => 'users#update'

  # Get a passport for a user
  post 'users/:id/passports/new' => 'passports#create'

  # Edit a passport for a user
  get 'users/:id/passports/edit' => 'passports#update'


  root 'static#home'

  #logout of the application
  post "sessions/destroy" => "sessions#destroy", as: :logout






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
