Rails.application.routes.draw do
  root 'statice_pages#home'
  get 'statice_pages/help'
  get 'statice_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
