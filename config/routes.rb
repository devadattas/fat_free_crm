ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.
  map.home "",  :controller => "home", :action => "index"
  map.resource  :profile, :controller => "users"
  map.resource  :user
  map.resource  :authentication
  map.resources :passwords
  map.resources :comments
  map.resources :tasks,         :has_many => :comments, :member => { :complete => :put }
  map.resources :accounts,      :has_many => :comments, :collection => { :search => :get }
  map.resources :campaigns,     :has_many => :comments, :collection => { :search => :get }
  map.resources :leads,         :has_many => :comments, :collection => { :search => :get }, :member => { :convert => :get, :promote => :put, :reject => :put }
  map.resources :contacts,      :has_many => :comments, :collection => { :search => :get }
  map.resources :opportunities, :has_many => :comments, :collection => { :search => :get }

  map.signup "signup", :controller => "users",           :action => "new"
  map.login  "login",  :controller => "authentications", :action => "new"
  map.logout "logout", :controller => "authentications", :action => "destroy"

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

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
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  
  map.connect ":controller/:action/:uuid", :uuid => /[a-f\d\-]{36}/
  map.connect ":controller/:action/:uuid.:format", :uuid => /[a-f\d\-]{36}/
  map.connect ":controller/:action/:id"
  map.connect ":controller/:action/:id.:format"
end
