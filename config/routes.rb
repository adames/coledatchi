Rails.application.routes.draw do

  root to: 'users#home'

  get '/login', to: 'sessions#new', as: 'login'
  # log in user
  post '/sessions', to: 'sessions#create', as: 'sessions'
  # log out user
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  get '/pets/:id/story', to: 'pets#story', as: 'story'


  resources :users, only: [:new, :create, :show]


  resources :pets, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
