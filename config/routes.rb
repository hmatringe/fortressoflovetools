Rails.application.routes.draw do

  resources :orders, only: [:index, :show, :edit, :create] do
    resources :order_lines, only: [:create, :destroy]
  end
  resources :products, only: [:index, :show, :new, :create]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
