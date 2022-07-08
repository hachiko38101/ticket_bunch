Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create]
    resources :programs, only: [:index, :create, :new ,:edit, :update] do
      resources :schedules, only: [:create, :update]
    end
  end
end