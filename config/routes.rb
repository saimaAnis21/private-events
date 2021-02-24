Rails.application.routes.draw do
  get 'users/sign_in', to: 'users#sign_in'
  get 'users/create', to: 'users#show'
  get 'users/show', to: 'users#show'
  post 'users/sign_in', to: 'users#logged_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#sign_in"
end
