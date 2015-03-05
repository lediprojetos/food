class CreateFdItempedidos < ActiveRecord::Migration
  def change
    create_table :fd_itempedidos do |t|
      t.string :desc_observacao
      t.decimal :valr_item
      t.string :tipo_atendimento
      t.references :fd_empresa, index: true
      t.references :fd_variacaoproduto, index: true
      t.references :fd_pedido, index: true
      t.references :fd_status, index: true
      t.references :fd_funcionario, index: true

      t.timestamps
    end
  end
end
