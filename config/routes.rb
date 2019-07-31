Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  resources :users, only: %i[new create]
  resources :clock_events, only: :create

  namespace :admin do
    resources :events, only: %i[index edit update destroy]
  end

  root 'dashboards#show'
end
