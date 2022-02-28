require 'WonderClass'

class Departamento < ApplicationRecord
    has_many :Insumo

    before_destroy :verifica_exclusao_departamento

    validates :nome, presence: true


    private

    def verifica_exclusao_departamento
        if Insumo.where("departamento_id = ?", id).count > 0
            raise WError.new 'Departamento não pode ser excluído pois possui Insumos.  Retire os Insumos deste departamento para em seguida excluí-lo !'
        end    
        return false
    end    
end