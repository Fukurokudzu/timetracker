Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'projects#index'

  resources :users, except: [ :new ]
  resources :projects, except: [ :new ] do
    resources :tasks do
      resources :sprints, except: [ :new ]
    end
  end
end
