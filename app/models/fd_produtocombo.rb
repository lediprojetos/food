class FdProdutocombo < ActiveRecord::Base
  belongs_to :fd_produto
  belongs_to :fd_produtocombo, :class_name => "FdProduto", :foreign_key => "fd_produto_combo"
  belongs_to :inclusao, :class_name => "FdUsuario", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "FdUsuario", :foreign_key => "user_exclusao"  
end
