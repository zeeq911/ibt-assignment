Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  resources :notes,          only: [:new, :create, :destroy, :edit, :update]
  post '/notes/:id', to:'notes#share'
  get '/notes/:id', to:'notes#show'
end
