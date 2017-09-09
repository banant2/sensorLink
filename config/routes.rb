SensorLink::Application.routes.draw do
  devise_for :users

  authenticated :user do
    root "welcome#dashboard", as: :authenticated_root
  end

  root "welcome#index"
  resources :accounts


  namespace :sensor do
    namespace :v1 do
      resources :env_data, param: :sensor_id
      resources :plants, param: :sensor_id
    end
  end
end
