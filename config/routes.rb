Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :favorites, only: [:create, :index, :destroy]
      get '/learning_resources', to: 'countries#show', as: 'country'
      get '/random_country', to: 'countries#random_country', as: 'random_country'
    end
  end
end
