Rails.application.routes.draw do
  resources :cocktails, only: [:new, :index, :show, :create]
  root to: "cocktails#index"
end
