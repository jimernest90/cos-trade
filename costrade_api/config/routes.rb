Rails.application.routes.draw do
  resources :items
  resources :users do
    collection do
      post "/login", to: "users#login"
      post "/register", to: "users#register"
      # get "welcome" , to: "users#welcome"
      # get "authorized" , to: "users#welcome"
    end
  end
end
