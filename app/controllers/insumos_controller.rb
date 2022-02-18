class InsumosController < ApplicationController
    before_action :set_insumo, only: [:destroy, :edit, :update]

    def index
        @ConsInsumos = Insumo.order :descricao
        @ConsInsumos_com_desconto = Insumo.order(:preco).limit 2
    end

    def create
        @insumo = Insumo.new insumo_params
        if @insumo.save  
            flash[:notice] = "Produto cadastrado com sucesso !"
            redirect_to root_url
        else
            renderiza :new
        end            
    end

    def destroy
        @insumo.destroy
        redirect_to root_url
    end

    def busca
        @descricao = params[:descricao]            
        @insumos = Insumo.where "lower(descricao) like ?", "%#{@descricao.downcase}%"
    end

    def new
        @insumo = Insumo.new
        @departamentos = Departamento.all
    end

    def edit
      renderiza :edit
    end

    def update
        if @insumo.update insumo_params
            flash[:notice] = "Insumo atualizado com sucesso !"
            redirect_to root_url
        else
            renderiza :edit
        end
    end

    #-----------------------------------------------------------------------------------------------------------#
    private

    def insumo_params
        valores = params.require(:insumo).permit(:codigo, :descricao, :preco, :quantidade, :departamento_id)        
    end

    def set_insumo
        @insumo = Insumo.find(params[:id])
    end

    def renderiza(view)
        @departamentos = Departamento.all  
        render view
    end

    #-----------------------------------------------------------------------------------------------------------#

end
