Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login'
  # log in user
  post '/sessions', to: 'sessions#create', as: 'sessions'
  # log out user
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  root to: 'users#index'


  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
