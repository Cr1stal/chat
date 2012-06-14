Chat::Application.routes.draw do
  #get "sessions/new"

  #get "sessions/create"

  #get "sessions/destroy"

  #get "message/index"
  #post "message/new"

  #get "message/create"

  #get "user/index"
  #get "user/exit"
  get "user/login"
  get "login" => "user#login"
  post "user" => "user#create"
  get "message/index"
  get "message" => "message#index"
  #post "message" => "message#create"
  post "message/index"
  post "message/create"
  #get "message/create"
  #post "user/login" => 'user#create'
  post "user/exit"
  #resources :message
  #resources :user

  #resource :user
  #get "chat/index"
  #get "chat/login"
  #post "chat/login"
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

  #match 'chat/index' => 'chat#index', :as => :index

  #get "chat/index"
  #post "chat/send"
  #delete "chat/exit"
  #get "chat/refresh"
  root :to => 'user#login'

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
