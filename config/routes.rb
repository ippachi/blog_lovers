Rails.application.routes.draw do
  get 'users/show'

  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:show], param: :screen_name do
    resources :articles
  end
end
