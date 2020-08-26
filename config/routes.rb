Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    # get "sign_in", to: "sessions#new"
    # post "sign_in",   to: 'sessions#create'
    delete "sign_out", to: "sessions#destroy"
    get 'users/:id', to: 'users#show'
    get 'name', to: 'users/registrations#new_name'
    post 'name', to: 'users/registrations#create_name'
  end

  resources :users
  resources :items do
    collection do
      get 'search'
      get 'search_tag'
    end
    resources :likes, only: [:create, :destroy]
    resources :messages
    resources :orders
  end

  namespace :api do
    resources :categories, only: [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  delete 'items/:id' => 'itemss#destroy'

end
