class CreateInsumos < ActiveRecord::Migration[7.0]
  def change
    create_table :insumos do |t|
      t.string :codigo, limit: 20
      t.text :descricao, limit: 500
      t.decimal :quantidade
      t.decimal :preco

      t.timestamps
    end
  end
end
