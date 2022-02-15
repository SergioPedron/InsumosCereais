class InsumosController < ApplicationController
    def index
        @ConsInsumos = Insumo.order :descricao
        @ConsInsumos_com_desconto = Insumo.order(:preco).limit 2
    end

    def create
        insumo = params.require(:insumo).permit(:codigo, :descricao, :preco, :quantidade)
        Insumo.create insumo
        redirect_to root_path
    end
end
