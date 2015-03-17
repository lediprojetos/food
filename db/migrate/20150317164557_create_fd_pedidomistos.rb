class CreateFdPedidomistos < ActiveRecord::Migration
  def change
    create_table :fd_pedidomistos do |t|
      t.references :fd_produto, index: true
      t.references :fd_itempedidos, index: true

      t.timestamps
    end
  end
end
