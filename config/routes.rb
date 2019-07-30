Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  resources :users, only: %i[new create]

  root 'dashboards#show'
end
