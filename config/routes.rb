Rails.application.routes.draw do
  get '/new', to:'notes#new'
  root 'notes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
