Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :listings, only: [:show]
  resources :brokers, only: [:index]

  # Using this route for testing of filterrific gem -- I was manually typing it into the browser url
  get '/listings' => 'listings#index'

  # I think you should keep these routes --they are a little bit more explicit
  get '/rentals' => 'listings#rentals'
  get '/sales' => 'listings#sales'

  # Not gonna need these routes -- they were for the filters controller when I was still using the has_scope gem
  get '/filter_rentals' => 'filters#filter_rentals'
  get '/filter_sales' => 'filters#filter_sales'

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

  # This is where I've set up the routes for the /admin/... pages
  namespace :admin do
    # Directs /admin/listings/* to Admin::ListingsController
    # (app/controllers/admin/listings_controller.rb)
    resources :listings
  end
end
