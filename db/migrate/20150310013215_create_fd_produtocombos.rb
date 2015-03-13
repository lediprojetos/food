class CreateFdProdutocombos < ActiveRecord::Migration
  def change
    create_table :fd_produtocombos do |t|
      t.integer :fd_produto_id, :integer, :references => :FdProduto, index: true 
      t.integer :fd_produto_combo, :integer, :references => :FdProduto, index: true 
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true
      t.timestamps
    end
  end
end
