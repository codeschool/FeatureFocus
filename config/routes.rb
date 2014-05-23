Rails.application.routes.draw do
  get 'projects/index'

  resources :projects
  root to: 'projects#index'
end
