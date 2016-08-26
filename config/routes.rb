Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#about"

  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  get "login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "users/:id", to: "users#show", as: "profile"

  resources :chatrooms, param: :slug
  resources :messages

  mount ActionCable.server => "/cable"
end
