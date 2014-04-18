XFiles::Application.routes.draw do
  root to: "documents#index"
  devise_for :users
  resources :users
  resources :roles
  resources :documents
  resources :assignments
end
