class CreateFdPedidocombos < ActiveRecord::Migration
  def change
    create_table :fd_pedidocombos do |t|
      t.references :fd_itempedidos, index: true
      t.references :fd_produtos, index: true

      t.timestamps
    end
  end
end
