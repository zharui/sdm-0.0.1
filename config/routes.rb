Sdm001::Application.routes.draw do
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	resources :m_ordinary_publishers  
	resources :m_ordinary_channels
	resources :m_ordinary_positions
	

  #get "users/new"
  
	root to: 'sessions#new'
	match '/signin', to: 'sessions#new', via: 'get'
	match '/signout', to: 'sessions#destroy', via: 'delete'
	match '/create_ordinary_publisher', to: 'm_ordinary_publishers#new', via: 'get'
#	match '/create_ordinary_channel', to: 'm_ordinary_channels#new', via: 'get'
	match '/edit_m_ordinary_channel', to: 'm_ordinary_channels#edit', via: 'get'
#	match '/create_ordinary_position', to: 'm_ordinary_positions#new', via: 'get'
	match '/edit_m_ordinary_position', to: 'm_ordinary_positions#edit', via: 'get'
#	match '/publishers', to: 'mm_ordinary_publishers#index', via: 'get'
	
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
