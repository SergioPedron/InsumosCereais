class DepartamentosController < ApplicationController
  before_action :set_departamento, only: [:destroy, :edit, :update, :show]

  def index
    @departamentos = Departamento.all
  end

  def new
    @departamento = Departamento.new
  end

  def edit
    renderiza :edit
  end

  def create
    @departamento = Departamento.new(departamento_params)
    if @departamento.save  
        flash[:notice] = "Departamento cadastrado com sucesso !"
        redirect_to departamentos_path
    else
        renderiza :new
    end            
  end

  def update
    if @departamento.update departamento_params
        flash[:notice] = "Departamento atualizado com sucesso !"
        redirect_to departamentos_path
    else
        renderiza :edit
    end    
  end

  def destroy
    begin
      @departamento.destroy
      flash[:notice] = "Departamento foi excluído com sucesso."
    rescue WError => e  
      flash[:danger] = e.message
    end    
    redirect_to departamentos_path

#      respond_to do |format|
#        format.html { redirect_to departamentos_url, notice: "Departamento foi excluído com sucesso." }
#        format.json { head :no_content }
#      end  
  end    

  def show
    @insumos_por_departamento = Insumo.where("departamento_id = ?", params[:id])
  end  

  private
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    def departamento_params
      params.require(:departamento).permit(:nome)
    end

    def renderiza(view)
      render view
  end
end
