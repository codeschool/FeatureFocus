Rails.application.routes.draw do
  resources :deals
  root to: 'deals#index'
end
