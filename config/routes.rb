Rails.application.routes.draw do
  get 'login', to: "sessions#new"
  delete 'logout', to: "sessions#destroy"
  resources :sessions, only: [:create]
  resources :registration, only: [:create]
  get 'sign_up', to: 'registration#new'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
