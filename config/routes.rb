Rails.application.routes.draw do
  devise_for :users
  resources :goods
  resource :profile, only: [:show, :edit, :update], as: :user_profile

  root 'main#index'
  get 'menu', to: 'goods#menu'
end
