Artgrabbr::Application.routes.draw do
  
  # get "orders/new"

  # get "orders/create"

  # get "orders/show"

  # get "artworks/show"

  # get "users/index"

  # get "users/show"

  resources :users
  resources :artworks
  resources :orders

  namespace :admin, :path => "payphone" do
    resources :users do
      member do
        resources :artworks
      end
    end
    resources :orders
  end

  root to: 'static_pages#home'

  match '/help', to: "static_pages#help"
  
end
