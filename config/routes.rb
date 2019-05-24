Rails.application.routes.draw do
  get 'cart/index', to: 'cart#index'
  get 'cart', to: 'cart#index'
  get 'administration/index', to: 'administration#index'
  resources :events
  resources :tickets
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :user_tickets

  # root :to => 'tickets#index'
  root :to => 'events#index'


  post '/login', to: 'sessions#create', as: :log_in
  delete '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in
  post 'cart/add_item', to: 'user_ticket#create', as: :add_item_to_cart
  post 'cart/pay', to: 'cart#pay', as: :pay_tickets
end
