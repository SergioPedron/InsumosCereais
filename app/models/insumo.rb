class Insumo < ApplicationRecord
   
    belongs_to :departamento, optional: true

    validates :preco, presence: true
    validates :descricao, length: { minimum: 4 }
end
