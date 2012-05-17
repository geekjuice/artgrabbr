Artgrabbr::Application.routes.draw do
  
  # get "orders/new"

  # get "orders/create"

  # get "orders/show"

  # get "artworks/show"

  # get "users/index"

  # get "users/show"

  resources :users do
    resources :artworks
  end
  resources :orders

  namespace :admin, :path => "payphone" do
    resources :users do
      member do
        resources :artworks do 
          member do
            resources :orders
          end
        end
      end
    end
  end #Fix this atrocity of a nest

  root to: 'static_pages#home'

  match '/help', to: "static_pages#help"
  
end
