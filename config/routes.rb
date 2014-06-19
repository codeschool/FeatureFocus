Rails.application.routes.draw do
  resources :deals do
    resources :referrals, shallow: true
    resources :purchases
  end

  post 'session_coordinates' => 'session_coordinates#create'

  root to: 'deals#index'
end
