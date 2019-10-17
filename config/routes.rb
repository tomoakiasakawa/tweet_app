Rails.application.routes.draw do
  root 'statice_pages#home'
  get '/help', to: 'statice_pages#help'
  get '/about', to: 'statice_pages#about'
  get '/contact', to:'statice_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, except: :new
end
