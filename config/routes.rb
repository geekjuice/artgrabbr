Artgrabbr::Application.routes.draw do

  resources :users do
    resources :artworks
  end
  resources :orders

  namespace :admin, :path => "payphone" do
    resources :users
    resources :artworks 
    resources :orders
  end 
  
  root to: 'static_pages#home'

  match '/help',    to: "static_pages#help"
  
end
