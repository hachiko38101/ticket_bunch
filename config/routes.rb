Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create]
  end
end