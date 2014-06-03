Rails.application.routes.draw do

  get 'projects/index'
  get 'progress' => 'progress#show'

  resources :projects
  root to: 'projects#index'
end
