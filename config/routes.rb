Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :goods
  resource :profile, only: [:show, :edit, :update], as: :user_profile
  resources :companies
  resources :users

  root 'main#index'
  get 'menu', to: 'goods#menu'
  get 'about' => 'goods#about'
  get 'adduser' => 'goods#adduser'
  get 'addprice' => 'goods#addprice'
end
