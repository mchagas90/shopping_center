Rails.application.routes.draw do
  resources :products
  resources :stores
  resources :users

  get "/auth/:provider/callback" => "sessions#create"
  root to: "stores#index"
  get "/signout" => "sessions#destroy", :as => :signout
  get "/signin" => "sessions#new", :as => :signin

end
