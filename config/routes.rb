Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'pages#home'
  resources :inventories, only: [:index, :show, :create, :destroy] do
    resources :inventory_primary_lines, only: [:index, :create] do
      collection { post :import }
    end
  end
  resources :inventory_primary_lines, only: :destroy

  resources :orders, only: [:index, :show, :create] do
    resources :order_lines, only: [:create]
    resources :invoices, only: [:new, :create, :show]
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
  scope '/hooks', controller: :webhooks do
    post :receive_fetched_sales_orders
    get :received
  end
  get "stats", to: 'stats#main_stats'
  get "dashboard", to: 'stats#dashboard'
end
