Rails.application.routes.draw do
  devise_for :users
  root 'notes#show'
  resources :notes,          only: [:new, :create, :destroy, :edit, :update]

end
