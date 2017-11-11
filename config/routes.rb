Rails.application.routes.draw do

  root to: 'pages#home'
  resources :inventories, only: [:index, :show, :create, :destroy] do
    resources :inventory_primary_lines, only: [:index, :create] do
      collection { post :import }
    end
  end
  resources :inventory_primary_lines, only: :destroy

  resources :orders, only: [:index, :show, :create] do
    resources :order_lines, only: [:create]
    resources :invoices, only: [:create]
  end
  resources :order_lines, only: :destroy
  resources :invoices, only: [:index, :destroy]

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection { post :import }
  end
  resources :sales_order_lines, only: [:index] do
    collection { post :import}
  end
  resources :purchase_order_drafts, only: [:index, :show, :new, :create]
  resources :purchase_order_draft_lines, only: [:edit, :update]
  devise_for :users
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  get "components", to: 'pages#components'
  get "cogs", to: 'pages#cogs'

end
