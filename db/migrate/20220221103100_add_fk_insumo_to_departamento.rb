class AddFkInsumoToDepartamento < ActiveRecord::Migration[7.0]
    def change
      #add_foreign_key(:insumos, :departamentos, column: :departamento_id, primary_key: "id", name: "FK_INSUMO_DEPTO")
      add_index(:insumos, :departamento_id, name: "IDX_DEPTO")
    end
  end
  