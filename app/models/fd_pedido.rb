class FdPedido < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :fd_cliente
  belongs_to :fd_mesa
  belongs_to :fd_funcionario
  belongs_to :fd_formapagamento
  belongs_to :fd_situacao#, :class_name => "FdSituacao", :foreign_key => 'fd_situacao_id'
end
