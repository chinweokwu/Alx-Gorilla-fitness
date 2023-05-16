Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :activities
  end
  root 'exercises#index'
  resources :exercises, only: [:index, :show]
end
