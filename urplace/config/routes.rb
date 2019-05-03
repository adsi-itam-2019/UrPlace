Rails.application.routes.draw do

  resources :houses
  root 'home#index'

  resources :routers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
