class FdItempedido < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :fd_variacaoproduto
  belongs_to :fd_pedido
  belongs_to :fd_status
  belongs_to :fd_funcionario
  belongs_to :fd_situacao
end
