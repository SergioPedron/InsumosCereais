class TrocaDepartamento
    #attr_accessor :Id_Novo_Depto    #Utilizar attr_accessor, quando for preciso tornar o atributo acessível para leitura e escrita do lado de fora da classe.  Ele cria os métodos de acesso de leitura e escrita

    def initialize(id_ant, id_novo, ids_insumos)
        #raise WError.new 'Insumos ...'+ids_insumos.join(',')
        if id_novo == ''
            raise WError.new 'Novo Departamento precisa ser informado (1)!'
        end  
        if id_novo == '0'
          raise WError.new 'Novo Departamento precisa ser informado (2)!'
        end  
        if id_novo == id_ant
            raise WError.new 'Departamento a ser trocado precisa ser diferente do novo departamento !'
        end    
        if ids_insumos.nil?
            raise WError.new 'Insumos precisam ser selecionados !'
        end  

        #self.Id_Novo_Depto_No_Insumo = id_novo_depto      #utilizar self para passar pelo método de escrita, que neste caso não possui (def Id_Novo_Depto_No_Insumo=(value))
        @Id_Ant_Depto      = id_ant
        @Id_Novo_Depto     = id_novo

        # Bem mais simples. Apenas recebe um array simples.   Utilizado na view:  <td><%= check_box_tag "insumos_selec[]", insumo.id %></td>
        @Ids_Insumos       = ids_insumos

        # Se na view for definido como hash de chave e valor:   <td><%= check_box_tag "insumos_selec[#{insumo.id}]", insumo.id, :name => "insumos_selec[]" %></td>
        # Aí, ids_insumos vem de params no formato parecido a um hash com chave e valor (Ex: {"4"=>"4", "20"=>"20"})
        # se fosse permitida conversão para hash neste ponto, poderia ser assim:  {"4"=>"4", "20"=>"20"}.map(&:first)
        #i = 0
        #@Ids_Insumos = Array.new
        #for chave, valor in ids_insumos
        #    #strIds = strIds + ((strIds=='') ? '' : ',') + "#{valor}"  #Se for utilizar string, inicializa os ids no formato 4,20 utilizando o operador ternário e concatendo o valor
        #    # Optamos por criar um novo array para passar direto ao where
        #    @Ids_Insumos[i] = "#{valor}"
        #    i += 1   # incrementaa 1 em i (equivale a i++)
        #end    
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
        #@insumos_para_troca_depto = Insumo.where("departamento_id = ? and id in (?)", @Id_Ant_Depto, @Ids_Insumos)
        @insumos_para_troca_depto = Insumo.where(departamento_id: @Id_Ant_Depto, id: @Ids_Insumos)
        if @insumos_para_troca_depto.count == 0
            @departamento_ant = Departamento.find(@Id_Ant_Depto)
            raise WError.new 'Não há insumos para o departamento ' + @departamento_ant.nome
        end    
        @insumos_para_troca_depto.each do |troca| 
            Insumo.update(troca.id, departamento_id: @Id_Novo_Depto)
        end    
    end

end    