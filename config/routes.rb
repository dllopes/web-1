Rails.application.routes.draw do
  resources :sales, only: [:new] do
    collection do
      post 'import_file_table' => 'sales#import_file_table'
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'sales#new'
end
