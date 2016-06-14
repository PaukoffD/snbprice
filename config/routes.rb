Rails.application.routes.draw do
  devise_for :users
  resources :goods
  resource :profile, only: [:show, :edit, :update], as: :user_profile

  root 'main#index'
  get 'menu', to: 'goods#menu'
  get 'about' => 'goods#about'
  get 'adduser' => 'goods#adduser'
  get 'addprice' => 'goods#addprice'
end
