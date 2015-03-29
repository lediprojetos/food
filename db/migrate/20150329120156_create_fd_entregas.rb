class CreateFdEntregas < ActiveRecord::Migration
  def change
    create_table :fd_entregas do |t|
      t.references :fd_pedido, index: true
      t.decimal :valr_entrega

      t.timestamps
    end
  end
end
