Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", to: "sessions#new"
    post "sign_in",   to: 'sessions#create'
    delete "sign_out", to: "sessions#destroy" 
    get 'users/:id', to: 'users#show'
  end

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"

end
