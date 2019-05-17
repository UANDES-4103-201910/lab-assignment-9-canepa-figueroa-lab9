Rails.application.routes.draw do
  # get 'products/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  # root :to => 'sessions#new'
  root :to => 'products#index'

  post '/login',   to: 'sessions#create', as: :log_in
  delete '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in

end
