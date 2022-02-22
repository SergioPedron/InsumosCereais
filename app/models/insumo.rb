class Insumo < ApplicationRecord
   
    belongs_to :departamento, optional: true,
        :class_name => "Departamento",
        :foreign_key => "departamento_id"

    validates :preco, :departamento, presence: true
    validates :descricao, length: { minimum: 4 }
end
