class CreateFdAdicionaisinclusos < ActiveRecord::Migration
  def change
    create_table :fd_adicionaisinclusos do |t|
      t.references :fd_itensadicional, index: true
      t.references :fd_itempedido, index: true
      t.integer :numr_quantidade

      t.timestamps
    end
  end
end
