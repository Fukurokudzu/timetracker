Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'projects#index'

  get 'signup', to: 'users#sign_up'
  get 'login', to: 'users#sign_in'

  resources :users, except: [ :new ]
  resources :projects
end
