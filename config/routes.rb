Rails.application.routes.draw do
  devise_for :users

  resources :products, only: [:show, :index]
  # resources :store, only: [:show] do
  resources :tickets, only: [:show, :index, :create, :new] do
    get :assign, to: "tickets#assign", on: :member
    get :closed, to: "tickets#closed", on: :member
  end
  get "/tickets/new/ticket_response", to: "tickets#ticket_response", as: 'ticket_response'
  get "/scan/barcode", to: "products#barcode", as: 'barcode'
  # end

  root to: 'pages#home'
end
