SensorLink::Application.routes.draw do
  devise_for :users
  #devise_for :installs
  root "welcome#index"
  resources :accounts
end
