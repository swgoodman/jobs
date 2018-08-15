Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users
  resources :companies
  resources :leads

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

end
