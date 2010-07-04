ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.connect 'bio', :controller => 'home', :action => 'bio'
  map.connect 'CV', :controller => 'home', :action => 'CV'
  map.connect 'alter_egos', :controller => 'home', :action => 'alter_egos'
  map.connect 'bio.html', :controller => 'home', :action => 'bio'
  map.connect 'CV.html', :controller => 'home', :action => 'CV'
  map.connect 'posts/show_all', :controller => 'posts', :action => 'show_all'  
    
  map.resources :posts
  map.resources :comments
  
  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  map.blog 'citingthetext', :controller => 'posts'
  map.connect 'blog', :controller => 'posts'

  map.connect 'posts/:id/:title', :controller => 'posts', :action => 'show'
  map.connect 'posts/:id', :controller => 'posts', :action => 'show'
  
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
