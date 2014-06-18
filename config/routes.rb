Rails.application.routes.draw do
  resources :deals do
    resources :referrals, shallow: true
  end

  root to: 'deals#index'
end
