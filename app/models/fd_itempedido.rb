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

def desc_ingredientemenos
    @desc_ingredientemenos
end

# setter
def desc_ingredientemenos=(val)
  @desc_ingredientemenos = val
end 

def desc_ingredientemais
    @desc_ingredientemais
end

# setter
def desc_ingredientemais=(val)
  @desc_ingredientemais = val
end 

def desc_itemadicional
    @desc_itemadicional
end

# setter
def desc_itemadicional=(val)
   @desc_itemadicional = val
end 


def desc_variaco
	return self.fd_variacaoproduto.fd_variacao.desc_variacao
end

def desc_variacaoMisto
  fd_pedidomisto = FdPedidomisto.where(:fd_itempedidos_id => self.id)
  return fd_pedidomisto.first.fd_variacaoproduto.fd_variacao.desc_variacao
end

end
