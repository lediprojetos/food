class CreateFdProdutos < ActiveRecord::Migration
  def change
    create_table :fd_produtos do |t|
      t.references :fd_empresa, index: true
      t.references :fd_categoriaproduto, index: true
      t.references :fd_usuario, index: true
      t.string :nome_produto
      t.string :desc_produto
      t.decimal :valr_produto

      t.timestamps
    end
  end
end
