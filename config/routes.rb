Rails.application.routes.draw do
  devise_for :users
  resources :goods
  root 'main#index'
  get 'menu', to: 'goods#menu'
end
