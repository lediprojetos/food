class CreateFdVariacaoprodutos < ActiveRecord::Migration
  def change
    create_table :fd_variacaoprodutos do |t|
      t.decimal :valr_produto
      t.references :fd_variaco, index: true
      t.references :fd_produto, index: true

      t.timestamps
    end
  end
end
