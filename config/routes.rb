Rails.application.routes.draw do


  resources :invitations, only: :create

  devise_for :tenants

  authenticated :user do
    root :to => "properties#index", as: :user_root
  end

  authenticated :tenant do
    root :to => "tenants#show", as: :tenant_root
  end
  resources :tenants

  resources :requests

  devise_for :users, controllers: {
    registrations: "my_devise/registrations"
  }


  get '/users/:id' => 'users#show', as: 'user'



  resources :properties do
    resources :tenants, controller: "properties/tenants"
  end

  resources :properties do
    resources :payables
    resources :receivables
  end

  #
  # namespace :tenants do
  #   resources :bills
  # end

  resources :charges, only: [:new, :create]

  resources :prawn, only: [:create]

  root 'properties#index'

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
