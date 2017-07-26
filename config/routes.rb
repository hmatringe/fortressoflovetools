Rails.application.routes.draw do

  resources :inventories, only: [:index, :show, :new, :create]

  resources :orders, only: [:index, :show, :edit, :create] do
    resources :order_lines, only: [:create]
    resources :invoices, only: [:create]
  end
  resources :order_lines, only: :destroy
  resources :invoices, only: :destroy
  resources :products, only: [:index, :show, :new, :create]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
