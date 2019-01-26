Rails.application.routes.draw do
  resources :sales, only: [:show, :new] do
    collection do
      post 'import_file_table' => 'sales#import_file_table'
    end
  end
  devise_for :users

  root to: 'sales#new'
end
