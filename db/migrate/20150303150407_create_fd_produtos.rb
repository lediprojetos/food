class CreateFdProdutos < ActiveRecord::Migration
  def change
    create_table :fd_produtos do |t|
      t.string :nome_produto
      t.string :desc_produto
      t.float :numr_porcentagem
      t.references :fd_empresa, index: true
      t.references :fd_categoriaproduto, index: true
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true

      t.timestamps
    end
  end
end
