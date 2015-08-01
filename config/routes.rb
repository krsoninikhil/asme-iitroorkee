Rails.application.routes.draw do
	post 'login' => 'sessions#create'
	get 'logout' => 'sessions#destroy'
  post 'create' => 'users#create'
	post 'mentorship-registration' => 'users#mentee_entry'
	get 'my-profile' => 'users#profile'
  post 'edit-profile' => 'users#edit_profile'
	
  get 'index' => 'static_pages#index'
  get 'activities' => 'static_pages#activities'
  get 'events' => 'static_pages#events'
  get 'involvements' => 'static_pages#involvements'
  get 'mentorship' => 'static_pages#mentorship'	
  get 'contact-us' => 'static_pages#contact_us'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'

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
