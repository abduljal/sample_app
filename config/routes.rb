SampleApp::Application.routes.draw do
 
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes
  resources :ingredients
  resources :steps
  resources :descriptions
 
  
  root  'static_pages#home'
  
   match '/edit_recipe',  to: 'recipes#edit',         via: 'get'
  match '/edit_recipe_home',  to: 'recipes#edit_Homepage',         via: 'get'
   match '/edit_recipe_home/:id',  to: 'recipes#edit_Homepage',         via: 'get'
   match '/new_recipe',  to: 'recipes#new',            via: 'get'
  match '/index_recipes',  to: 'recipes#index',            via: 'get'
   match '/destroy_recipe',  to: 'recipes#destroy',         via: 'delete'
  
  match '/add_ingredient',  to: 'ingredients#new',         via: 'get'
  match '/edit_ingredient',  to: 'ingredients#edit',         via: 'get'
  match '/edit_add_ingredient',  to: 'ingredients#edit_add',         via: 'get'
  match '/create_edit_ingredient',  to: 'ingredients#create_edit',         via: 'post'
  match '/destroy_ingredient',  to: 'ingredients#destroy',         via: 'delete'
 
 
  match '/add_description',  to: 'descriptions#new',         via: 'get'
  match '/destroy_description',  to: 'descriptions#destroy',         via: 'delete'
   
  match '/add_step',  to: 'steps#new',            via: 'get'
  match '/edit_step',  to: 'steps#edit',         via: 'get'
  match '/edit_add_step',  to: 'steps#edit_add',         via: 'get'
  match '/create_edit_step',  to: 'steps#create_edit',         via: 'post'
  match '/destroy_step',  to: 'steps#destroy',         via: 'delete'
 
 
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
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
