Rails.application.routes.draw do

  # root 'welcome#index'
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

  # Not gonna need these routes -- they were for the filters controller when I was still using the has_scope gem
  # get '/filter_rentals' => 'filters#filter_rentals'
  # get '/filter_sales' => 'filters#filter_sales'

  # This is where I've set up the routes for the /admin/... pages
  namespace :admin do
    # Directs /admin/listings/* to Admin::ListingsController
    # (app/controllers/admin/listings_controller.rb)
    resources :listings
  end
end
