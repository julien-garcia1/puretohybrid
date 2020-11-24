Rails.application.routes.draw do
  devise_for :users

  resources :products, only: [:show, :index]

  resources :tickets, only: [:show, :index, :create, :new] do
    get :accept, to: "tickets#accept", on: :member
    get :closed, to: "tickets#closed", on: :member
  end

  root to: 'pages#home'
end
