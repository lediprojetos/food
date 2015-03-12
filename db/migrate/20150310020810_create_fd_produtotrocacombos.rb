class CreateFdProdutotrocacombos < ActiveRecord::Migration
  def change
    create_table :fd_produtotrocacombos do |t|
      t.references :fd_produto, index: true
      t.references :fd_produtocombo, index: true

      t.timestamps
    end
  end
end
