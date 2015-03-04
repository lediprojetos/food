class FdVariacaoproduto < ActiveRecord::Base
  #belongs_to :fd_variacaos
  belongs_to :fd_variacao, :class_name => "FdVariacao", :foreign_key => "fd_variaco_id"
  belongs_to :fd_produto
end
