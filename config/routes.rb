Rails.application.routes.draw do
  devise_for :users
  resources :infolists
  resources :post_images, only: [:new, :create, :index, :show]
  
  # get 'infolists/new'
  # root 'homes#top'
  root 'infolists#index'
  get "/about" => "homes#about", as: "about"
  get "/qa" => "homes#qa", as: "qa"
  # get 'infolists' => 'infolists#index'
  post 'infolists' => 'infolists#create'
  # get 'infolists/:id' => 'infolists#show', as: 'infolist'
  # get 'infolists/:id/edit' => 'infolists#edit', as: 'edit_infolist'
  patch 'infolists/:id' => 'infolists#update', as: 'update_infolist'
  delete 'infolists/:id' => 'infolists#destroy', as: 'destroy_infolist'
end
