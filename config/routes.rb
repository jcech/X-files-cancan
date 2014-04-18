XFiles::Application.routes.draw do
  root to: "devise/registrations#new"
  devise_for :users
  resources :users
  resources :roles
  resources :files
end
