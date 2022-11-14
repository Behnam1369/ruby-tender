Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "invitation/:key", to: "invitation#show"
  get "invitation/:key/visit", to: "invitation#visit"
end
