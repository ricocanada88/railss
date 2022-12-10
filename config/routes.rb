# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "mains#index"

  get '/about', to: 'abouts#index', as: :about

  get '/password', to: 'passwords#edit', as: :password
  patch '/password', to: 'passwords#update', as: :passwords

  get '/sing-up', to: 'registers#new', as: :register
  post '/sing-up', to: 'registers#create', as: :registers

  get '/sing-in', to: 'sessions#new', as: :signin
  post '/sing-in', to: 'sessions#create', as: :signins

  get '/password/reset', to: 'password_resets#new', as: :password_reset
  post '/password/reset', to: 'password_resets#create', as: :password_resets

  get '/password/reset/edit', to: 'password_resets#edit'
  patch '/password/reset/edit', to: 'password_resets#update'

  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  resources :twitter_accounts
  resources :tweets


  delete '/logout', to: 'sessions#destroy', as: :logout
end
