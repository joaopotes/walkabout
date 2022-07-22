Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :excursions do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update, :destroy]
  get '/mybookings', to: 'pages#bookings_profile'
  get '/myexcursions', to: 'pages#excursions_profile'
end
