SensorLink::Application.routes.draw do
  devise_for :users
  #devise_for :installs
  root "welcome#index"
  resources :accounts

  namespace :sensor do
    namespace :v1 do
      resources :env_data
      resources :plants
    end
  end
end
