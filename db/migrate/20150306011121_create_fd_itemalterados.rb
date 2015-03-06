class CreateFdItemalterados < ActiveRecord::Migration
  def change
    create_table :fd_itemalterados do |t|
      t.integer :numr_acao
      t.integer :numr_quntidade
      t.references :fd_itempedido, index: true
      t.references :fd_items, index: true

      t.timestamps
    end
  end
end
