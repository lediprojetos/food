class FdPedidomisto < ActiveRecord::Base
  belongs_to :fd_produto
  belongs_to :fd_itempedidos
end
