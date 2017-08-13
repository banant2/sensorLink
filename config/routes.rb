SensorLink::Application.routes.draw do
  devise_for :users
  root "welcome#index"
  resources :accounts


  namespace :sensor do
    namespace :v1 do
      resources :env_data
      resources :plants, param: :sensorID
    end
  end
end
