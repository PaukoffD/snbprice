Rails.application.routes.draw do
  resources :goods
  root 'main#index'
  get 'menu', to: 'goods#menu'
end
