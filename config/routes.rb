Rails.application.routes.draw do
  resources :todos
  resources :users
  root "users#index"
  get "/signin" => "sessions#new",as: :new_signin
  post "/signin" => "sessions#create",as: :signin
  delete "/signout" => "sessions#destroy",as: :destroy_session
end