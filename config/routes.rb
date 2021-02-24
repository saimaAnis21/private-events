Rails.application.routes.draw do
  get 'users/new', to: 'users#show'
  get 'users/create', to: 'users#show'
  get 'users/show', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#show"
end
