Ecommerce::Application.routes.draw do
  get "static/about"
  get "static/contact"
  get "product/index"

  root :to => 'product#index', :via => :get

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  match '/about' => "static#about", :as => 'about', :via => :get
  match '/contact' => "static#contact", :as => 'contact', :via => :get
  
  match 'products/on_sale' => "product#sale", :as => 'sale', :via => :get
  match 'products/new_items' => "product#new", :as => 'new', :via => :get

  match 'products/cfl' => "product#cfl", :as => 'cfl', :via => :get
  match 'products/nfl' => "product#nfl", :as => 'nfl', :via => :get
  match 'products/nba' => "product#nba", :as => 'nba', :via => :get
  match 'products/mlb' => "product#mlb", :as => 'mlb', :via => :get
  match 'products/nhl' => "product#nhl", :as => 'nhl', :via => :get
  
  match 'search_results' => 'product#search_results', :as => 'search_results', :via => :post
  match 'search_cfl' => 'product#search_cfl', :as => 'search_cfl', :via => :post
  match 'search_nfl' => 'product#search_nfl', :as => 'search_nfl', :via => :post
  match 'search_nba' => 'product#search_nba', :as => 'search_nba', :via => :post
  match 'search_mlb' => 'product#search_mlb', :as => 'search_mlb', :via => :post
  match 'search_nhl' => 'product#search_nhl', :as => 'search_nhl', :via => :post


  match '/clear_cart' => "product#clear_cart", :as => 'clear_cart', :via => :post

  match 'product/add_product/:id' => "product#add_product", :as => 'add_product', :via => :post
  match 'product/remove_product/:id' => "product#remove_product", :as => 'remove_product', :via => :post

  match '/checkout' => "product#checkout", :as => 'checkout', :via => :get
  match '/finish_checkout' => "product#finish_checkout", :as => 'finish_checkout', :via => :post

  match 'products/:id' => "product#show", :as => 'product', :via => :get
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
