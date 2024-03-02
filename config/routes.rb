Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      get '/learning_resources', to: 'countries#show', as: 'country'
    end
  end
end
