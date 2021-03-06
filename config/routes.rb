Rails.application.routes.draw do

  # Vendor Panel
  namespace :vendor do
    get 'restaurant_orders' => 'restaurant_orders#index'
    get 'restaurant_orders/:id' => 'restaurant_orders#show'

    patch 'restaurant_orders/:id/approve' => 'restaurant_orders#approve'
    patch 'restaurant_orders/:id/reject' => 'restaurant_orders#reject'
    patch 'restaurant_orders/:id/ready' => 'restaurant_orders#ready'
    patch 'restaurant_orders/:id/collected' => 'restaurant_orders#collected'

    put 'restaurant_orders/:id/approve' => 'restaurant_orders#approve'
    put 'restaurant_orders/:id/reject' => 'restaurant_orders#reject'
    put 'restaurant_orders/:id/ready' => 'restaurant_orders#ready'
    put 'restaurant_orders/:id/collected' => 'restaurant_orders#collected'
  end

  # Admin Panel
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Authentication
  post '/auth' => 'user_token#create'
  post '/auth/facebook' => 'oauth#create'

  # Verification
  get '/auth/verify' => 'verify_user#get_otp'
  post '/auth/verify' => 'verify_user#verify_otp'

  # AddOns
  get 'add_ons/:id' => 'add_ons#show'

  # AddOnLinks
  get 'add_on_links/:id' => 'add_on_links#show'

  # AddOnTypes
  get 'add_on_types/:id' => 'add_on_types#show'

  # AddOnTypeLinks
  get 'add_on_type_links/:id' => 'add_on_type_links#show'

  # Addresses
  resources :addresses

  # Cart
  get '/cart' => 'orders#cart'
  post '/cart' => 'orders#order_items'
  post '/cart/purchase/cod' => 'orders#purchase_cod'

  # Cities
  get 'cities' => 'cities#index'
  get 'cities/:id' => 'cities#show'
  get 'cities/:id/locations' => 'cities#locations'

  # Locations
  get 'locations/:id' => 'locations#show'

  # DishCategories
  get 'dish_categories' => 'dish_categories#index'
  get 'dish_categories/:id' => 'dish_categories#show'
  get 'dish_categories/:id/dishes' => 'dish_categories#dishes'

  # Dishes
  get 'dishes/:id' => 'dishes#show'

  # DishVariants
  get 'dish_variants/:id' => 'dish_variants#show'

  # Restaurants
  get 'restaurants/:id' => 'restaurants#show'

  # Variants
  get 'variants/:id' => 'variants#show'

  # VariantCategories
  get 'variant_categories/:id' => 'variant_categories#show'

  # Orders
  get 'orders' => 'orders#index'
  get 'orders/:id' => 'orders#show'

  # OrderStatuses
  get 'order_statuses/:id' => 'order_statuses#show'

  # PaymentMethods
  get 'payment_methods/:id' => 'payment_methods#show'

  # Users
  get 'users/me' => 'users#me'
  post 'users/me/location' => 'users#set_location'
  patch 'users/me/location' => 'users#set_location'
  post 'users/create' => 'users#create'
  patch 'users/me' => 'users#me'

  # ActionCable
  mount ActionCable.server => '/cable'

end
