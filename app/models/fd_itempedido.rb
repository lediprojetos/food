class FdItempedido < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :fd_variacaoproduto
  belongs_to :fd_pedido
  belongs_to :fd_status
  belongs_to :fd_funcionario
  belongs_to :fd_situacao


def desc_pedido
    @desc_pedido
end

# setter
def desc_pedido=(val)
  @desc_pedido = val
end 

end
