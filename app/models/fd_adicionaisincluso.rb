class FdAdicionaisincluso < ActiveRecord::Base
  belongs_to :fd_itensadicional
  belongs_to :fd_itempedido
end
