class TrocaDepartamento
    #attr_accessor :iId_Novo_Depto_No_Insumo    #Utilizar attr_accessor, quando for preciso tornar o atributo acessível para leitura e escrita do lado de fora da classe.  Ele cria os métodos de acesso de leitura e escrita
    :Id_Ant_Depto
    :Id_Novo_Depto

    def initialize(id_ant, id_novo)
        #self.Id_Novo_Depto_No_Insumo = id_novo_depto      #utilizar self para passar pelo método de escrita, que neste caso não possui (def Id_Novo_Depto_No_Insumo=(value))
        @Id_Ant_Depto   = id_ant
        @Id_Novo_Depto  = id_novo
    end

    #Métodos de leitura e escrita.  Por enquanto não são necessários
    #def Id_Novo_Depto
    #    @Id_Novo_Depto
    # end
    #def Id_Novo_Depto=(value)
    #    @iId_Novo_Depto = value
    #end    

    public

    def TrocarDepartamento
        if @Id_Novo_Depto == ''
            raise WError.new 'Novo Departamento precisa ser informado (1)!'
          end  
        if @Id_Novo_Depto == 0
          raise WError.new 'Novo Departamento precisa ser informado (2)!'
        end  
        if @Id_Novo_Depto == @Id_Ant_Depto
            raise WError.new 'Departamento a ser trocado precisa ser diferente do novo departamento !'
        end    
        @insumos_para_troca_depto = Insumo.where("departamento_id = ?", @Id_Ant_Depto)
        if @insumos_para_troca_depto.count == 0
            @departamento_ant = Departamento.find(@Id_Ant_Depto)
            raise WError.new 'Não há insumos para o departamento ' + @departamento_ant.nome
        end    
        @insumos_para_troca_depto.each do |troca| 
            Insumo.update(troca.id, departamento_id: @Id_Novo_Depto)
        end    
    end

end    