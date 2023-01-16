Rails.application.routes.draw do
  get 'render/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      post '/update-profile', to: 'users#update'
      get '/profile', to: 'users#profile'
      delete '/delete-account', to: 'users#destroy'
    end
  end
  resources :nutrition_reports

  # For more details on this file's DSL, see https://guides.rubyonrails.org/routing.html
  root 'render#index'
end
