Rails.application.routes.draw do
  devise_for :users
  get '/notes', to:'notes#show'
  post '/notes', to:'notes#new'
  root 'notes#show'
end
