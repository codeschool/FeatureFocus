Rails.application.routes.draw do

  resources :projects, only: [:index, :show], shallow: true do
    resources :messages
    resources :comments
  end

  get 'progress' => 'progress#show'

  root to: 'projects#index'
end
