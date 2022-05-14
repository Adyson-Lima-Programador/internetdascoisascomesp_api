Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :logins, only: [:create]
      resources :users
      resources :devices
    end
  end
  
end
