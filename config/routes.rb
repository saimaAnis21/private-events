Rails.application.routes.draw do
  get 'events/show'
  get 'users/sign_in', to: 'users#sign_in'
  post 'users/sign_in', to: 'users#logged_in'
  delete 'users/log_out', to: 'users#log_out'

  get 'users/sign_up', to: 'users#sign_up'
  post 'users/sign_up', to: 'users#create'

  get 'users/show', to: 'users#show'
  
  
  get 'events/new', to: 'events#new'
  post 'events/new', to: 'events#create'
  get 'events/show', to: 'events#show'
  get 'events/index', to: 'events#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#sign_up"
end
