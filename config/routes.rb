Artgrabbr::Application.routes.draw do

  # get "mailing_lists/create"

  get "password_resets/new"

  root to: 'static_pages#home'
  # root to: 'users#index'
  match '/faq',         to: "static_pages#faq"
  match '/about',       to: "static_pages#about"
  match '/contact',     to: "static_pages#contact"
  match '/howitworks',  to: "static_pages#howitworks"

  match '/signup',  to: 'buyers#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


# PUBLIC ACCESS
  resources :users, path: "artists", only:[:index, :show]
  resources :artworks do
    member do
      match '/sold',  to: "artworks#sold"
    end
  end
  resources :orders
  resources :buyers do
    member do
      match '/validate',  to: "buyers#validate"
      match '/reverification',  to: "buyers#resend_validation"
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets
  resources :mailing_lists



# ADMIN ACCESS
  namespace :admin, :path => "payphone" do

    root to:'users#index'
    match '/togglemain', to: 'artwork_images#togglemain'

    resources :users do
      resources :orders, only: [:index]
      member do
        delete :remove_avatar
        match '/accept', to: "users#accept"
        match '/decline', to: "users#decline"
        match '/undo', to: "users#undo"
      end
    end
    resources :artworks
    resources :artwork_images
    resources :orders do
      member do
        delete :remove_avatar
        match '/acceptEmail', to: "orders#acceptEmail"
      end
    end
    resources :buyers
    resources :sessions, only: [:new, :create, :destroy]
  end

end
