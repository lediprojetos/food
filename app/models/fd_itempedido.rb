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


def desc_variaco
	return self.fd_variacaoproduto.fd_variacao.desc_variacao
end


# setter
def desc_pedido=(val)
  @desc_pedido = val
end 

def desc_itemalterados
    @desc_pedido
end

# setter
def desc_itemalterados=(val)
  @desc_pedido = val
end 

def desc_pedido
    @desc_pedido
end

# setter
def desc_pedido=(val)
  @desc_pedido = val
end 

end
