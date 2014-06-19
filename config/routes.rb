Rails.application.routes.draw do
  resources :deals do
    resources :purchases
  end

  post 'session_coordinates' => 'session_coordinates#create'
  get '/referrals/:token' => 'referrals#new'
  get '/logout' => 'session#destroy'

  root to: 'deals#index'
end
