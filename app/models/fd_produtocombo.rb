class FdProdutocombo < ActiveRecord::Base
  belongs_to :fd_produtos
  belongs_to :fd_produto_combo_id, :class_name => "FdProduto", :foreign_key => "fd_produto_combo"
  belongs_to :inclusao, :class_name => "FdUsuario", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "FdUsuario", :foreign_key => "user_exclusao"  
end
