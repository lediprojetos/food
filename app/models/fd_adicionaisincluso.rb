class FdAdicionaisincluso < ActiveRecord::Base
  belongs_to :fd_itensadicionals
  belongs_to :fd_itempedido
end
