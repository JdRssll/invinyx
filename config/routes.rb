Invinyx::Application.routes.draw do
  get "obra/index"

  get "proveedors/index"

  get "factura/index"

  resources :productos
  resources :pedidos do
    resources :devolucions, only: [:new]
    member do
      get :devoluciones
    end
  end
  resources :articulos
  resources :facturas
  resources :proveedors
  resources :devolucions
  resources :obras

  get "/agregar/empleado/:id" => 'pedidos#asignar_empleado_a_pedido', :as => :empleado_info 

  get "/agregar/articulo/:id" => 'pedidos#asignar_articulo_a_pedido', :as => :articulo_info
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  get '/agregar/:id' => 'application#articulos_facturas',  :as => :articulos_facturas

  

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
  root :to => 'articulos#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
