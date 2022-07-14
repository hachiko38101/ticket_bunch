Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create]
    resources :programs do
      resources :schedules, only: [:new, :create, :edit, :destroy, :update]
    end
  end
end