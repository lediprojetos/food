class CreateFdItensprodutos < ActiveRecord::Migration
  def change
    create_table :fd_itensprodutos do |t|
      t.references :fd_produto, index: true
      t.references :fd_item, index: true
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true

      t.timestamps
    end
  end
end
