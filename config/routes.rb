Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources cria de forma automática as routes abaixo
  # delete "insumos/:id", to: "insumos#destroy", as: :insumo
  # post "insumos", to: "insumos#create"
  # get "insumos/new", to: "insumos#new"


  Rails.application.routes.draw do
    get "insumos/busca", to: "insumos#busca", as: :busca_insumo
    resources :insumos, only: [:new, :create, :destroy]
    root to: "insumos#index"  
  end  

end
