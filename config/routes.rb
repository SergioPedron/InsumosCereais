Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "produtos", to: "produtos#index"
  post "insumos", to: "insumos#create"
  get "insumos/new", to: "insumos#new"
  root to: "insumos#index"  
end
