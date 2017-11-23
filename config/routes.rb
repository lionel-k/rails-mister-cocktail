Rails.application.routes.draw do
  resources :cocktails, only: [:new, :index, :show, :create] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
  root to: "cocktails#index"
end
