Rails.application.routes.draw do

  resources :projects, only: [:index, :show], shallow: true do
    resources :messages
    resources :comments
    #resources :accesses
  end

  resources :users

  get 'progress' => 'progress#show'

  get 'search' => 'search#index', as: :search

  root to: 'projects#index'
end
