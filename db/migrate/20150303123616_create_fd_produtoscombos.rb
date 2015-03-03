class CreateFdProdutoscombos < ActiveRecord::Migration
  def change
    create_table :fd_produtoscombos do |t|
      t.references :fd_produto, index: true
      t.references :fd_produto, index: true

      t.timestamps
    end
  end
end
