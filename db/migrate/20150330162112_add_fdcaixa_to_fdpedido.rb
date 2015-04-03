class AddFdcaixaToFdpedido < ActiveRecord::Migration
  def change
    add_reference :fd_pedidos, :fd_caixa, index: true
  end
end
