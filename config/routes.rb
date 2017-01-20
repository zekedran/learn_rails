Rails.application.routes.draw do

  get 'dish_variant/show'

  # Admin Panel
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Authentication
  post '/auth' => 'user_token#create'
  post '/auth/facebook' => 'auth_facebook#create'
  post '/auth/facebook/fetch_details' => 'auth_facebook#fetch_details'

  # Verification
  get '/auth/verify' => 'verify_user#get_otp'
  post '/auth/verify' => 'verify_user#verify_otp'


  # Addresses
  resources :addresses

  # Cart
  get '/cart' => 'orders#cart'
  post '/cart' => 'orders#order_items'
  post '/cart/set_address' => 'orders#set_address'
  post '/cart/purchase/cod' => 'orders#purchase_cod'

  # Cities
  get 'cities' => 'cities#index'
  get 'cities/:id/locations' => 'cities#locations'

  # Combos
  get 'combos' => 'combos#index'
  get 'combos/:id' => 'combos#show'

  # DishCategories
  get 'dish_categories' => 'dish_categories#index'
  get 'dish_categories/:id/dishes' => 'dish_categories#dishes'

  # Dishes
  get 'dishes/:id' => 'dishes#show'

  # DishVariants
  get 'dish_variants/:id' => 'dish_variants#show'

  # Variants
  get 'variants/:id' => 'variants#show'

  # Orders
  get 'orders' => 'orders#index'
  get 'orders/:id' => 'orders#show'

  # Users
  get 'users/me' => 'users#me'
  post 'users/create' => 'users#create'
  patch 'users/me' => 'users#me'

end
