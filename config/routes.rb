Rails.application.routes.draw do
  get 'statice_pages/contact'
  root 'statice_pages#home'
  get '/help', to: 'statice_pages#help'
  get '/about', to: 'statice_pages#about'
  get '/contact', to:'statice_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
