Rails.application.routes.draw do
  
  root 'pages#cdl_optin'
  # root 'pages#index'

  resources :attempts
  resources :choices
  resources :questions

  # Practice Tests
  resources :tests do
    resources :questions
  end

  devise_for :users
  
  get 'order', to: 'pages#order'

  # Marketing pages
  get 'class-a-endorsement', to: 'pages#class_a_endorsement', as: :class_a_endorsement
  get 'class-b-endorsement', to: 'pages#class_b_endorsement', as: :class_b_endorsement
  get 'hazardous-materials-endorsement', to: 'pages#hazardous_materials_endorsement', as: :hazardous_materials_endorsement
  get 'double-triple-endorsement', to: 'pages#double_triple_endorsement', as: :double_triple_endorsement
  get 'tank-vehicle-endorsement', to: 'pages#tank_vehicle_endorsement', as: :tank_vehicle_endorsement
  get 'passenger-vehicle-endorsement', to: 'pages#passenger_vehicle_endorsement', as: :passenger_vehicle_endorsement
  get 'school-bus-endorsement', to: 'pages#school_bus_endorsement', as: :school_bus_endorsement

  # Successful payment/signup page
  get "success", to: 'pages#success'

  # post 'payment_notifications', controller: 'payment_notifications', action: 'create'
  # get "success", to: 'pages#success'
  # get "success_premium", to: 'pages#success_premium'
  # get "success_ultimate", to: 'pages#success_ultimate'
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
