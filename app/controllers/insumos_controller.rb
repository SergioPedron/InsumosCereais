class InsumosController < ApplicationController
    def index
        @ConsInsumos = Insumo.order :descricao
        @ConsInsumos_com_desconto = Insumo.order(:preco).limit 2
    end

    def create
        insumo = params.require(:insumo).permit(:codigo, :descricao, :preco, :quantidade)
        Insumo.create insumo
        redirect_to root_url
    end

    def destroy
        id = params[:id]
        Insumo.destroy id
        redirect_to root_url
    end

    def busca
        @descricao = params[:descricao]            
        @insumos = Insumo.where "lower(descricao) like ?", "%#{@descricao.downcase}%"
    end

end
