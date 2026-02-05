Rails.application.routes.draw do
  root "messages#index"
  resources :messages, only: [:index, :create]
  resources :sessions, only: [:new, :create]

  get "up" => "rails/health#show", as: :rails_health_check
end
