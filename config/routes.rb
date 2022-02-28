Rails.application.routes.draw do
  resources :departamentos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources cria de forma automática as routes abaixo
  # delete "insumos/:id", to: "insumos#destroy", as: :insumo
  # post "insumos", to: "insumos#create"
  # get "insumos/new", to: "insumos#new"


  Rails.application.routes.draw do
    get 'departamentos/troca/:id',       controller: 'departamentos', action: 'troca',       as: 'troca_departamento'
    get 'departamentos/grava_troca/:id', controller: 'departamentos', action: 'grava_troca', as: 'grava_troca_departamento'
    resources :departamentos
      
    get "insumos/busca", to: "insumos#busca", as: :busca_insumo
    resources :insumos, only: [:new, :create, :destroy, :edit, :update]
    
    root to: "insumos#index"  
  end  

end
