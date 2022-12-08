# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "mains#index"

  get '/about', to: 'abouts#index', as: :about


end
