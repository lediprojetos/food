class FdPedidocombo < ActiveRecord::Base
  belongs_to :fd_itempedidos
  belongs_to :fd_produtos
end
