# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "mains#index"

  get '/about', to: 'abouts#index', as: :about

  get '/sing-up', to: 'registers#new', as: :register
  post '/sing-up', to: 'registers#create', as: :registers
  # post '/sing-up', to: 'registers#create', as: :register_create
end
