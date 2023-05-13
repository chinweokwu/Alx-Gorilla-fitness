Rails.application.routes.draw do
  root 'exercises#index'
  resources :exercises, only: [:index, :show]
end
