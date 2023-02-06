Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'projects#index'

  passwordless_for :users, at: '/', as: :auth
  
  resources :users #, except: [ :new ]

  resources :projects, except: [ :new ] do
    resources :tasks do
      resources :sprints, except: [ :new ]
    end
  end
end
