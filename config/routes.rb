Rails.application.routes.draw do
  resources :sales
  resources :purchases
  devise_for :users

  root to: 'sales#new'
end
