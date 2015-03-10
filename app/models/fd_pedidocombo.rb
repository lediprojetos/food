class FdPedidocombo < ActiveRecord::Base
  belongs_to :fd_itempedidos
  belongs_to :fd_produtos

  belongs_to :fd_produto, :class_name => "FdProduto", :foreign_key => "fd_produtos_id"
end
