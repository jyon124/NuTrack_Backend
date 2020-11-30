Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      post '/login', to: 'auth#create'
      post '/update-profile', to: 'users#update'
      get '/profile', to: 'users#profile'
    end
  end
  resources :nutrition_reports
end
