Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/secret', to: 'home#secret'
end
