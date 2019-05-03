Rails.application.routes.draw do

  resources :houses
  root 'houses#index'

  get 'home/profile'

  resources :routers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
