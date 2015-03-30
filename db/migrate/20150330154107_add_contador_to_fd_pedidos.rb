class AddContadorToFdPedidos < ActiveRecord::Migration
  def change
    add_column :fd_pedidos, :numr_contador, :integer
  end
end
