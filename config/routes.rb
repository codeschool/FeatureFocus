Rails.application.routes.draw do


  resources :projects, only: [:index, :show]
  resources :messages
  resources :comments

  get 'progress' => 'progress#show'

  root to: 'projects#index'
end
