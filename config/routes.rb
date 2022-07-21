Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :excursions do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:destroy]

  #  we want to create profile pages for the users (both normal users and hosts), when the users sign up, the users will,
  #  be created, so we dont need the method new or the create
  resources :pages, except: [:new, :create]
end
