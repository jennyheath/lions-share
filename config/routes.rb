Rails.application.routes.draw do
  root 'static_pages#root'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  resources :listings, defaults: { format: :json }
  # resources :brokers, only: [:index]

  # Using this route for testing of filterrific gem -- I was manually typing it into the browser url
  # get '/listings' => 'listings#index'

  # I think you should keep these routes --they are a little bit more explicit
  # get '/rentals' => 'listings#rentals'
  # get '/sales' => 'listings#sales'

  # This is where I've set up the routes for the /admin/... pages
  get 'admin' => 'admin/sessions#new'

  namespace :admin do
    # Directs /admin/listings/* to Admin::ListingsController
    # (app/controllers/admin/listings_controller.rb)
    resources :users
    resource :session, only: [:new, :create, :destroy]
    resources :listings
    resources :brokers
  end
end
