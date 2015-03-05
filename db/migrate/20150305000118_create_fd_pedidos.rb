class CreateFdPedidos < ActiveRecord::Migration
  def change
    create_table :fd_pedidos do |t|
      t.decimal :valr_pedido
      t.boolean :flag_pago
      t.references :fd_empresa, index: true
      t.references :fd_cliente, index: true
      t.references :fd_mesa, index: true
      t.references :fd_funcionario, index: true
      t.references :fd_formapagamento, index: true
      t.references :fd_status, index: true

      t.timestamps
    end
  end
end
