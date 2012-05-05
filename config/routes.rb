Artgrabbr::Application.routes.draw do
  
  resources :users do
    resources :artworks
  end

  resources :orders

  root to: 'static_pages#home'
  
  match '/help', to: "static_pages#help"
  
end
