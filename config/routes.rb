Artgrabbr::Application.routes.draw do

# PUBLIC ACCESS
  resources :users
  resources :artworks
  resources :orders

  root to: 'static_pages#home'
  match '/help',    to: "static_pages#help"


# ADMIN ACCESS
  namespace :admin, :path => "payphone" do
    resources :users
    resources :artworks 
    resources :orders

    root to:'users#index'
  end 
end
