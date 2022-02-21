class AddIdxInsumoToDepartamento < ActiveRecord::Migration[7.0]
    def change
      add_index(:insumos, :departamento_id, name: "IDX_DEPTO")
    end
  end
  