class AddTipoAtendimentoToFdPedidos < ActiveRecord::Migration
  def change
    add_column :fd_pedidos, :tipo_atendimento, :string
  end
end
