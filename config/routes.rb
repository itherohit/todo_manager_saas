Rails.application.routes.draw do
  resources :todos
  resources :users
  root "users#index"
end