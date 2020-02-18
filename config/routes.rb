Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: 'users/registrations',
    sessions:  'users/sessions'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rooms#index'

  resources :users, only: [:show]
  resources :categories, only: [:show]
  resources :rooms do
    resources :messages, only: [:create]
  end
end
